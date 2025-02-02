;^j::
;{
;    MyVar := StrReplace(Round(10.00 * 0.937, 2), ".", ",")
;    Send MyVar
;}

^j:: {
    multiplicarPor937(inicio, fim) { 
        numeroAnterior := ""  ; Variável para armazenar o número anterior
    
        ; Itera sobre os números no intervalo de início até fim
        Loop {
            if (inicio > fim) 
                break
            
            ; Multiplica o número por 0.937 e arredonda para 2 casas decimais
            resultado := Format("{:.2f}", inicio * 0.937)
    
            ; Obtém o último dígito do resultado
            ultimoCentavo := SubStr(resultado, -1)
    
            if (ultimoCentavo = "5" || ultimoCentavo = "9") {
                if (numeroAnterior != "") {
                    ; Adiciona 0.01 ao primeiro número do intervalo
                    numeroInicial := Format("{:.2f}", numeroAnterior + 0.01)
    
                    ; Exibe o intervalo com o número inicial ajustado
                    ; MsgBox "Intervalo: " numeroInicial " -> " Format("{:.2f}", inicio)
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
                ; Atualiza o número anterior com o atual
                numeroAnterior := inicio
            }
    
            ; Incrementa o valor de início em 0.01
            inicio += 0.01
        }
    }
    
    ; Exemplo de uso da função
    multiplicarPor937(15.00, 15.50)
}
