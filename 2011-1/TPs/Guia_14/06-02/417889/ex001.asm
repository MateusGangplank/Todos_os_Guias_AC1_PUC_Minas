; Douglas de Loredo Borges - 417889

; Implementar um programa para o processador 8085 para
; calcular o resultado da express�o aritm�tica abaixo,
; usando dados com 8 bits.
; dado04 = dado01 + dado02 - dado03


; �rea de C�digos

     LXI H,dado01
     MOV A,M
     INX H
     ADD M
     INX H
     SUB M
     STA dado04
     HLT


; �rea de Dados

dado01: @EQU 000C
dado02: @EQU 000D
dado03: @EQU 000E
dado04: @EQU 000F