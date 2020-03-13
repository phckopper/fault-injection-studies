# Um injetor de falhas realmente básico

### Baseado no repositório llvm-pass-skeleton

Injetor de falhas realmente básico baseado no artigo https://www.cs.cornell.edu/~asampson/blog/llvm.html e na documentação do LLVM.
Inverte um bit no retorno de todas as funções (por enquanto).

### Build:

```bash
    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    $ cd ..
```

### Run:

```bash
    $ clang -Xclang -load -Xclang build/skeleton/libSkeletonPass.* something.c
```
