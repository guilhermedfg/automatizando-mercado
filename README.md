# automatizando-mercado
---

# AutoHotkey Script - Ajuste de Preços com Multiplicação por 0.937 (descontar 6,3%)

Este script foi desenvolvido para automatizar a atualização de preços em um sistema de mercado. Ele multiplica valores dentro de um intervalo especificado por 0.937 (6,3%)), arredonda os resultados para duas casas decimais e envia comandos automaticamente para o sistema.

## 📌 Funcionalidade

O script executa os seguintes passos:

1. **Multiplica valores dentro de um intervalo** pelo fator **0.937**.
2. **Verifica os últimos dígitos dos valores calculados**:
   - Se o resultado termina em **5** ou **9**, ele identifica um novo intervalo para ajuste.
3. **Envia comandos automaticamente** para atualizar os preços no sistema:
   - Converte os valores para o formato apropriado (substituindo `.` por `,`).
   - Simula entradas de teclado para preencher os campos e confirmar ajustes.
   - Utiliza `Sleep` para garantir que o sistema processe as entradas corretamente.
4. **Automação de teclas** para navegação eficiente no sistema:
   - Usa `Enter`, `F3`, `Esc` e outras teclas para interagir com a interface do software.

## 📌 Como Usar

1. **Instale o AutoHotkey** caso ainda não tenha:
   - Baixe em: [https://www.autohotkey.com/](https://www.autohotkey.com/)
   
2. **Crie um script AHK** ou baixe este repositório.

3. **Execute o script** e pressione `Ctrl + J` (`^j`) para iniciar o processo.

4. **O script processará os valores automaticamente** no intervalo pré-definido (`multiplicarPor937(15.00, 15.50)`). Para alterar o intervalo, modifique os parâmetros na chamada da função.

## 🛠️ Exemplo de Código

```ahk
^j:: {
    multiplicarPor937(inicio, fim) { 
        numeroAnterior := ""  

        Loop {
            if (inicio > fim) 
                break
            
            resultado := Format("{:.2f}", inicio * 0.937)
            ultimoCentavo := SubStr(resultado, -1)

            if (ultimoCentavo = "5" || ultimoCentavo = "9") {
                if (numeroAnterior != "") {
                    numeroInicial := Format("{:.2f}", numeroAnterior + 0.01)

                    firstNumber := StrReplace(numeroInicial, ".", ",")
                    lastNumber := StrReplace(Format("{:.2f}", inicio), ".", ",")

                    Send firstNumber
                    Sleep 500
                    Send "{Enter}"
                    Sleep 500
                    Send lastNumber
                    Sleep 500
                    Send "{Enter}"
                    Sleep 500
                    Send "{Enter}"
                    Sleep 500
                    Send lastNumber
                    Sleep 500
                    Send "{F3}"
                    Sleep 500
                    Send "{Esc}"
                    Sleep 500
                    Send "{F3}"
                    Sleep 500
                    Send "{Enter}"
                    Sleep 500
                    Send "{Enter}"
                    Sleep 500
                }
                numeroAnterior := inicio
            }
            inicio += 0.01
        }
    }

    multiplicarPor937(15.00, 15.50)
}
```

## 📌 Personalização

- **Intervalo de Preços**: Alterar os valores de `multiplicarPor937(inicio, fim)` no final do código.
- **Tempos de Espera (`Sleep`)**: Ajustar os `Sleep` caso o sistema seja mais rápido ou mais lento.
- **Teclas de Atalho**: Modificar a tecla de ativação (`^j`, ou seja, `Ctrl + J`) conforme necessário.

## ⚠️ Aviso

- Certifique-se de testar o script em um ambiente seguro antes de usá-lo em produção.
- Pequenos atrasos (`Sleep`) podem ser ajustados conforme o desempenho do sistema onde será utilizado.
