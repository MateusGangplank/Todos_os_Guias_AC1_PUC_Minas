; Aluno: Alyson Deives
; Matricula: 416589

; Implementar um programa para o processador 8085 para
; calcular o resultado da expressão aritmética abaixo,
; usando dados com 16 bits.
; dado04 = dado01 + dado02 - dado03

; Definição de Dados

dado01H: NOP
dado01L: NOP
dado02H: NOP
dado02L: NOP
dado03H: NOP
dado03L: NOP
dado04H: NOP
dado04L: NOP

; Códigos

     LXI H,dado01L
     MOV A,M
     LXI H,dado02L
     ADD M
     MOV C,A
     MVI D,00h
     JNC SOMA
     INX D
SOMA:
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
     JNS SUB
     INX D
SUB:
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


