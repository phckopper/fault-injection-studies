BENCH = jpeg
LIB_INSTRUMENTING = /home/phckopper/fault-injection-studies/fault-instrumentation-pass/build/instrumenting/libInstrumentingPass.so
LIB_TAGGER = /home/phckopper/tagger-pass/build/tagger/libTaggerPass.so

# Creates metadata identifying every instruction
$(BENCH)_tagged.bc:
	opt-3.5 -load=$(LIB_TAGGER) -tagger $(BENCH)_exact.bc -o $(BENCH)_tagged.bc

# Compiles the tagged .bc into an object file and produces address.map
$(BENCH)_tagged.o: $(BENCH)_tagged.bc
	clang -Xclang -load -Xclang $(LIB_INSTRUMENTING) -O0 -c $(BENCH)_tagged.bc

$(BENCH): $(BENCH)_tagged.o
	clang-3.5 injectionManager.o populateIO.o $(BENCH)_tagged.o -o $(BENCH)

