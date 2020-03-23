#include <cstdint>

#include "llvm/Pass.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
using namespace llvm;

namespace {
  struct InstrumentingPass : public FunctionPass {
    static char ID;
    InstrumentingPass() : FunctionPass(ID) {}
    
    void injectInstruction(Instruction *thisInst, std::uintptr_t address, Value *addrToInject, Value *mask, Value *smallMask) {
            errs() << "Injecting at address " << address << ": ";
            errs() << *thisInst << "\n";

            Instruction *nextInst = thisInst->getNextNode();
            auto constAddress = ConstantInt::get(Type::getInt64Ty(thisInst->getContext()), address, false);

            IRBuilder<> builder(nextInst);

            Value* cmp = builder.CreateICmpEQ(constAddress, addrToInject);
            Instruction *ThenTerm , *ElseTerm;
            SplitBlockAndInsertIfThenElse(cmp, nextInst, &ThenTerm, &ElseTerm, nullptr);
            builder.SetInsertPoint(ThenTerm);
            Value* error;
            if(thisInst->getType()->getPrimitiveSizeInBits() == 64) {
                Value* tmp  = builder.CreateBitCast(thisInst, Type::getInt64Ty(thisInst->getContext()));
                Value* tmp2 = builder.CreateXor(tmp, mask);
                error = builder.CreateBitCast(tmp2, thisInst->getType());
                errs() << "lossless to 64 \n";
            } else if(thisInst->getType()->getPrimitiveSizeInBits() == 32) {
                Value* tmp  = builder.CreateBitCast(thisInst, Type::getInt32Ty(thisInst->getContext()));
                Value* tmp2 = builder.CreateXor(tmp, smallMask);
                error = builder.CreateBitCast(tmp2, thisInst->getType());
                errs() << "lossless to 32 \n";
            } else {
                error = builder.CreateXor(thisInst, mask);
                errs() << "oh shit help \n";
            }

            builder.SetInsertPoint(nextInst);

            PHINode* phi = builder.CreatePHI(thisInst->getType(), 2, "injection");
            phi->addIncoming(error, ThenTerm->getParent());
            
            thisInst->replaceUsesOutsideBlock(phi, ThenTerm->getParent());
            phi->addIncoming(thisInst, ElseTerm->getParent());

    }

    virtual bool runOnFunction(Function &F) {
      if(F.getName() == "main")
          return false;

      LLVMContext& Ctx = F.getContext();
      FunctionCallee shouldInject = F.getParent()->getOrInsertFunction(
        "_shouldInject", Type::getInt64Ty(Ctx)
      );
      FunctionCallee getInjectionMask = F.getParent()->getOrInsertFunction(
        "_getInjectionMask", Type::getInt64Ty(Ctx)
      );
        

      errs() << "Injecting function " << F.getName() << "!\n";
      std::vector<Instruction *> toInject;

      IRBuilder<> builder(F.getEntryBlock().getFirstNonPHIOrDbgOrLifetime());
      Value *addrToInject  = builder.CreateCall(shouldInject);
      Value *injectionMask = builder.CreateCall(getInjectionMask);
      Value *smallMask     = builder.CreateTruncOrBitCast(injectionMask, Type::getInt32Ty(Ctx));

      for (inst_iterator I = inst_begin(F), E = inst_end(F); I != E; ++I) {
        //if(I->getType() == Type::getInt32Ty(Ctx) || I->getType() == Type::getFloatTy(Ctx)) {
        if(I->isBinaryOp() || I->isUnaryOp())
            toInject.push_back(&*I);
        //}
      }

      std::error_code errorCode; 
      raw_fd_ostream address_map("address.map", errorCode);

      for(Instruction *I: toInject) {
        std::uintptr_t address = reinterpret_cast<std::uintptr_t>(I);
        injectInstruction(I, address, addrToInject, injectionMask, smallMask);

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
