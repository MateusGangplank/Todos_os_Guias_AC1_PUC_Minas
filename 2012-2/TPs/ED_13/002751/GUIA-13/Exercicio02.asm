//--------------------------------------------------------------
//Guia 13 -Exercicio 02
//simulador Intel 8085
//Nome - Milton costa teles da silva - 002751
//--------------------------------------------------------------

//Implementar um programa para o processador 8085 para
//calcular o resultado da expressão aritmética abaixo,
//usando dados com 16 bits.
//Sugestão: Usar complemento de 2 em uma das operações. 
dado04 = dado01 - dado02 - dado03

     LXI H,dado01L
     MOV A,M
     LXI H,dado02L
     ADD M
     MOV C,A

     MVI D,00h
     JNC LABEL01
     MVI D,01h

     L01:
     LXI H,dado01H
     MOV A,M
     LXI H,dado02H
     ADD M
     ADD D
     MOV B,A
     MOV A,C
     LXI H,dado03L
     SUB M
     MOV C,A

     MVI D,00h
     JNS L02
     MVI D,01h

     L02:
     MOV A,B
     LXI H,dado03H
     SUB M
     SUB D
     MOV B,A
     MOV A,B
     STA dado04H
     MOV A,C
     STA dado04L
     HLT


;Dados
	
dado01H: @EQU 0035
dado01L: @EQU 0036
dado02H: @EQU 0037
dado02L: @EQU 0038
dado03H: @EQU 0039
dado03L: @EQU 003A
dado04H: @EQU 003B
dado04L: @EQU 003C