# injection-runner

Permite a execução de campanhas de injeção de falhas.

---

Gerenciador de campanhas de injeção de falhas escrito em Python 3.8, com suporte a binários instrumentados pela fault-instrumentation-pass do LLVM.

### Instalação

A única dependência (por enquanto) é a biblioteca `colored`, que pode ser instalada via pip.
```bash
pip install -U colored
```

### Uso

Para rodar uma campanha de injeção num binário, é necessário ter ele e o seu arquivo de mapa de endereços. Tendo eles, é possível rodar uma campanha rodando:

```bash
./injection_runner.py ../examples/a.out ../examples/address.map
```
Onde o primeiro arquivo é o binário a ser testado e o segundo é o arquivo de mapa.

Feito isso, o relatório da campanha será salvo em report.log e os detalhes serão exibidos na stdout. Um exemplo de relatório está disponível nesse repositório.
