; Douglas de Loredo Borges - 417889

; Implementar um programa para o processador 8085 para
; calcular o resultado da express�o aritm�tica abaixo,
; usando dados com 8 bits codificados em BCD.
; dado04 = dado01 + dado02 - dado03


; �rea de C�digos

     LXI H,dado01
     MOV A,M
     INX H
     ADD M
     INX H
     SUB M
     DAA
     STA dado04
     HLT


; �rea de Dados

dado01: @EQU 000D
dado02: @EQU 000E
dado03: @EQU 000F
dado04: @EQU 0010
