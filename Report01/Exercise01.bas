Dim user_weight As Double
Dim drank_water As Double
Dim water_goal As Double

Print "Entre com o peso (kg):"
Input user_weight

Print "Entre com a quantidade de agua ingerida no dia (ml):"
Input drank_water

water_goal = user_weight * 35

If drank_water >= water_goal Then
    Print "Meta atingida!"
Else
    Print "Meta nao atingida"
End If

Sleep