Dim pin As Integer
Dim correct_pin As Integer

correct_pin = 61854

Print "Entre com o pin:"
Input pin

While pin <> correct_pin
    Print "PIN invalido. Tente novamente."
    Print "Entre com o pin:"
    Input pin
Wend

Print "Transacao autorizada!"

Sleep