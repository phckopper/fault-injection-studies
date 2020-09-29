#include <cstdint>

#define __clang_major__ 3

#include "llvm/Pass.h"
#include "llvm/ADT/StringRef.h"
//#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

namespace {
  struct InstrumentingPass : public FunctionPass {
    static char ID;
    InstrumentingPass() : FunctionPass(ID) {}
    

    StringRef getPassName(void) {
        return StringRef("InstrumentingPass");
    }

    bool ShouldReplace(Use &U, BasicBlock *BB) {
        auto *I = dyn_cast<Instruction>(U.getUser());
        // Don't replace if it's an instruction in the BB basic block.
        return !I || I->getParent() != BB;
    }

    void replaceUsesOutsideBlock(Value *V, Value *New, BasicBlock *BB) {
        for (Value::use_iterator UI = V->use_begin(), E = V->use_end(); UI != E;) {
            Use &U = *UI;
            ++UI;
            if (!ShouldReplace(U, BB))
                continue;
            U.set(New);
        }
    }

    Instruction* selectInsertionPoint(Instruction *I) {
        Instruction* i = I->getNextNode();
        while(isa<PHINode>(i)) {
            errs() << "found phi node " << *i << "\n";
            i = i->getNextNode();
        }
        return i;
    }

    void injectInstruction(Instruction *thisInst, std::uintptr_t address, Constant *getInjectionMaskIfApplicable) {
            errs() << *thisInst << "\n";

            Value* constAddress = ConstantInt::get(Type::getInt64Ty(thisInst->getContext()), address, false);

            unsigned int size = thisInst->getType()->getPrimitiveSizeInBits();
            if(thisInst->getType()->isPointerTy()) size = 64;
            Instruction *nextInst = selectInsertionPoint(thisInst);
            if(nextInst == nullptr) {
                errs() << "FAILED!\n";
                return;
            }

            IRBuilder<> builder(nextInst);

            Value* mask = builder.CreateCall(getInjectionMaskIfApplicable, constAddress);
            Value* cmp = builder.CreateICmpNE(mask, builder.getInt64(0));
            #if __clang_major__ <= 3 
                TerminatorInst *ThenTerm, *ElseTerm;
            #else
                Instruction *ThenTerm, *ElseTerm;
            #endif
            SplitBlockAndInsertIfThenElse(cmp, nextInst, &ThenTerm, &ElseTerm, nullptr);
            builder.SetInsertPoint(ThenTerm);
            Value* error;
            Value* tmp;
            
            if(thisInst->getType()->isPointerTy())
                tmp = builder.CreatePtrToInt(thisInst, Type::getIntNTy(thisInst->getContext(), size));
            else
                tmp = builder.CreateBitCast(thisInst, Type::getIntNTy(thisInst->getContext(), size));
            Value* maskT = builder.CreateTrunc(mask, Type::getIntNTy(thisInst->getContext(), size));
            Value* tmp2  = builder.CreateXor(tmp, maskT);

            if(thisInst->getType()->isPointerTy())
                error = builder.CreateIntToPtr(tmp2, thisInst->getType(), "erroneous");
            else
                error = builder.CreateBitCast(tmp2, thisInst->getType(), "erroneous");

            builder.SetInsertPoint(nextInst);

            PHINode* phi = builder.CreatePHI(thisInst->getType(), 2, "injection");
            phi->addIncoming(error, ThenTerm->getParent());

            replaceUsesOutsideBlock(thisInst, phi, ThenTerm->getParent());
            phi->addIncoming(thisInst, ElseTerm->getParent());

    }

    virtual bool runOnFunction(Function &F) {

      LLVMContext& Ctx = F.getContext();
      #if __clang_major__ <= 3 
          Constant *getInjectionMaskIfApplicable = F.getParent()->getOrInsertFunction(
            "_getInjectionMaskIfApplicable", Type::getInt64Ty(Ctx), Type::getInt64Ty(Ctx), NULL
          );
      #else
          FunctionCallee shouldInject = F.getParent()->getOrInsertFunction(
            "_shouldInject", Type::getInt64Ty(Ctx)
          );
          FunctionCallee getInjectionMask = F.getParent()->getOrInsertFunction(
            "_getInjectionMask", Type::getInt64Ty(Ctx)
          );
      #endif
        

      errs() << "Injecting function " << F.getName() << "!\n";
      std::vector<Instruction *> toInject;

      for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        //if(I->getType() == Type::getInt32Ty(Ctx) || I->getType() == Type::getFloatTy(Ctx)) {
        if(I->getType()->isFloatTy() || I->getType()->isDoubleTy() || I->getType()->isIntegerTy() || I->getType()->isPointerTy())
            if(!isa<CallInst>(*I) && !I->isCast()) {
                errs() << "Instr " << *I << "\n";
                    toInject.push_back(&*I);
            }
        //}
      }

      #if __clang_major__ <= 3 
          std::string errorCode; 
          raw_fd_ostream address_map("address.map", errorCode, sys::fs::F_Append);
      #else
          std::error_code errorCode; 
          raw_fd_ostream address_map("address.map", errorCode);
      #endif

      for(Instruction *I: toInject) {
        auto address = std::stoi(dyn_cast<MDString>(I->getMetadata("ufrgs.lse.id")->getOperand(0))->getString());
        errs() << address << "\n";
        injectInstruction(I, address, getInjectionMaskIfApplicable); 

        address_map << address << "," << I->getType()->getPrimitiveSizeInBits() << "," << *I << "\n";
        // Modificamos a função
      }
     
      return true;
    }
  };
}

char InstrumentingPass::ID = 0;
static RegisterPass<InstrumentingPass> X("instrumenting", "Fault Instrumenting Pass",
                             false /* Only looks at CFG */,
                             false /* Analysis Pass */);

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerInstrumentingPass(const PassManagerBuilder &,
                         legacy::PassManagerBase &PM) {
  PM.add(new InstrumentingPass());
}
static RegisterStandardPasses
  RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
                 registerInstrumentingPass);
