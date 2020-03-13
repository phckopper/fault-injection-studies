# Estudos sobre injeção de falhas

---

Esse repositório contém código de estudo que permite instrumentar programas em tempo de compilação para injeção de falhas.

### Instalação

**Clone esse repositório:**
```bash
git clone https://github.com/phckopper/fault-injection-studies.git
```

**Rode o script de compilação da passada:**
```bash
./build_pass
```
Pronto! Agora você pode rodar códigos de exemplo utilizando o script `./build_examples`.

### Funcionamento

A injeção condicional de falhas é realizada através da implementação de uma passada (pass) da LLVM, alterando a representação intermediária do código.

Para rodar ela durante a compilação, passamos o arquivo `libInstrumentingPass.so` para o Clang, que irá executar ela junto com as demais passadas normais. Foi optado por desenvolver essa passada "out-of-tree", ou seja, sem recompilar a LLVM/Clang, com o objetivo de facilitar o desenvolvimento e o uso.

A passada é implementada na classe `InstrumentingPass`, que é registrada no PassManager da LLVM com prioridade de EarlyAsPossible. Nela, é implementado o callback `runOnFunction`, que nos permite tratar as funções individuais do código. No início de cada função do código original, é injetada uma chamada para uma função externa `_shouldInject`, definida em arquivo .c externo, que retorna o endereço da instrução a ser injetada. O endereço de cada instrução é gerado com base no valor do ponteiro que aponta para a mesma durante a compilação, sendo salva em arquivo externo para permitir o posterior mapeamento de cada instrução com seu endereço. A máscara a ser utilizada na operação xor é dada pela função `_getInjectionMask`. Nos códigos de exemplo, ambas as funções lêem o endereço de injeção e a máscara das variáveis de ambiente.

Antes de cada instrução que retorna um tipo injetável (por enquanto, Int32), é injetada uma instrução de comparação condicional `ICmpEQ`, que verifica se a instrução deve retornar o seu valor normal ou o valor injetado. Após isso, o valor a ser passado adiante é decidido por uma instrução Phi, que decide qual valor será utilizado com base na branch tomada.

---

© 2020 Pedro Henrique Capp Kopper. Some Rights Reserved.
