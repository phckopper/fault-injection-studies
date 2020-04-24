#include <cstdint>

#define __clang_major__ 3

#include "llvm/Pass.h"
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
using namespace llvm;

namespace {
  struct InstrumentingPass : public FunctionPass {
    static char ID;
    InstrumentingPass() : FunctionPass(ID) {}

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

    void injectInstruction(Instruction *thisInst, std::uintptr_t address, Value *addrToInject, Value *mask64, Value *mask32, Value *mask1) {
            errs() << "Injecting at address " << address << ": ";
            errs() << *thisInst << "\n";

            unsigned int size = thisInst->getType()->getPrimitiveSizeInBits();
            if(size == 8)
                return;
            Instruction *nextInst = thisInst->getNextNode();
            auto constAddress = ConstantInt::get(Type::getInt64Ty(thisInst->getContext()), address, false);

            IRBuilder<> builder(nextInst);

            Value* cmp = builder.CreateICmpEQ(constAddress, addrToInject);
            #if __clang_major__ <= 3 
                TerminatorInst *ThenTerm, *ElseTerm;
            #else
                Instruction *ThenTerm, *ElseTerm;
            #endif
            SplitBlockAndInsertIfThenElse(cmp, nextInst, &ThenTerm, &ElseTerm, nullptr);
            builder.SetInsertPoint(ThenTerm);
            Value* error;
            if(thisInst->getType()->isPointerTy()) size = 64;
            Value* tmp;
            
            if(thisInst->getType()->isPointerTy())
                tmp = builder.CreatePtrToInt(thisInst, Type::getIntNTy(thisInst->getContext(), size));
            else
                tmp = builder.CreateBitCast(thisInst, Type::getIntNTy(thisInst->getContext(), size));
            Value* tmp2;
            if(size == 1)
                tmp2 = builder.CreateXor(tmp, mask1);
            if(size == 32)
                tmp2 = builder.CreateXor(tmp, mask32);
            if(size == 64)
                tmp2 = builder.CreateXor(tmp, mask64);

            if(thisInst->getType()->isPointerTy())
                error = builder.CreateIntToPtr(tmp2, thisInst->getType());
            else
                error = builder.CreateBitCast(tmp2, thisInst->getType());

            builder.SetInsertPoint(nextInst);

            PHINode* phi = builder.CreatePHI(thisInst->getType(), 2, "injection");
            phi->addIncoming(error, ThenTerm->getParent());

            replaceUsesOutsideBlock(thisInst, phi, ThenTerm->getParent());
            phi->addIncoming(thisInst, ElseTerm->getParent());

    }

    virtual bool runOnFunction(Function &F) {
      if(F.getName() == "main")
          return false;

      LLVMContext& Ctx = F.getContext();
      #if __clang_major__ <= 3 
          Constant *shouldInject = F.getParent()->getOrInsertFunction(
            "_shouldInject", Type::getInt64Ty(Ctx), NULL
          );
          Constant *getInjectionMask = F.getParent()->getOrInsertFunction(
            "_getInjectionMask", Type::getInt64Ty(Ctx), NULL
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

      IRBuilder<> builder(F.getEntryBlock().getFirstNonPHIOrDbgOrLifetime());
      Value *addrToInject    = builder.CreateCall(shouldInject);
      Value *injectionMask   = builder.CreateCall(getInjectionMask);
      Value *smallMask       = builder.CreateTruncOrBitCast(injectionMask, Type::getInt32Ty(Ctx));
      Value *smallerMask     = builder.CreateTruncOrBitCast(injectionMask, Type::getInt1Ty(Ctx));

      for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        //if(I->getType() == Type::getInt32Ty(Ctx) || I->getType() == Type::getFloatTy(Ctx)) {
        if(I->getType()->isFloatTy() || I->getType()->isDoubleTy() || I->getType()->isIntegerTy() || I->getType()->isPointerTy())
            if(!isa<CallInst>(*I))
                toInject.push_back(&*I);
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
        std::uintptr_t address = reinterpret_cast<std::uintptr_t>(I);
        injectInstruction(I, address, addrToInject, injectionMask, smallMask, smallerMask);

        address_map << address << "," << I->getType()->getPrimitiveSizeInBits() << "," << *I << "\n";
        // Modificamos a função
      }
        
      return true;
    }
  };
}

char InstrumentingPass::ID = 0;

// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerInstrumentingPass(const PassManagerBuilder &,
                         legacy::PassManagerBase &PM) {
  PM.add(new InstrumentingPass());
}
static RegisterStandardPasses
  RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
                 registerInstrumentingPass);
