.MODEL SMALL
.STACK
.DATA
     msgIngreseNumero1 DB 13,"Ingrese primer numero: $"
     msgIngreseNumero2 DB 10,13,"Ingrese segundo numero: $"
     msgSuma DB 10,13,"La resta es: $"
     num1 DB ? ;m = num1
     num2 DB ? ;n = num2
     cien DB 100


.CODE


 MOV AX,@DATA ;iniciar variables
 MOV DS,AX


 ;mensaje
 MOV AH, 09h
 LEA DX, msgIngreseNumero1
 INT 21H


 ;recibir ler numero
 MOV AH,01H
 INT 21H
 SUB AL, 30H
 MOV num1,AL


 INT 21H


 ;PARTE 2  
 SUB AL,30H
 MOV AH,num1
 AAD ;Ajuste de ASCII
 MOV num1,AL


 MOV AH,09h
 LEA DX,msgIngreseNumero2
 INT 21H


 MOV AH,01h
 INT 21H
 SUB AL,30H


 MOV num2,AL
 INT 21H


 ;PARTE 3
 SUB AL,30H


 MOV AH,num2
 AAD
 MOV num2,AL


 MOV AH,09h
 LEA DX,msgSuma
 INT 21H
 MOV AL,num1
 SUB AL,num2


 AAM


 ADD AX,3030H
 MOV BX,AX


 MOV AH,02h




 MOV DL,BH
 INT 21H


 MOV DL,BL
 INT 21H


 MOV AH,4ch
 INT 21h
 INT 27H


end
