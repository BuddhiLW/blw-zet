# Clean Architecture

# Use Cases

- Apresenta uma intenção;
- Automação de tarefas e processos;
- Concretização de uma automação;
- Usa regras de negócios - o fluxo de execução é o caso de uso.
- Use-cases não acessam diretamente as execuções;
- Use-case utilizam abstração para execução de tarefas (ex. repositórios);
- "Camada de aplicação", no DDD.

# Domain Driven Design



# Refactoring examples

``` go
func Calc(a int, b int) int {
    r := a * b
    if r > 100 {
        r = r - 25
    } else if r > 50 {
        r = r - 10
    } else {
        r = r + 15
    }
    return r
}
``` 

``` go 
struct CalcRequest {
	baseA int
	baseB int
}

func liquidValueCases(product int) int {
	r := product
    if isAboveThreshold(product) {
        r = r - 25
    } else if isAboveHalfThreshold(product) {
        r = r - 10
    } else {
        r = r + 15
    }
	return r
}

func isAboveThreshold(value int) bool {
	return value > 100
}

func isAboveHalfThreshold(value int) bool {
	return value > 50
}


func (c CalcRequest) LiquidValue() int {
    product := c.baseA * c.baseB
    liquidValue := liquidValueCases(product)
    return liquidValue
}
``` 
