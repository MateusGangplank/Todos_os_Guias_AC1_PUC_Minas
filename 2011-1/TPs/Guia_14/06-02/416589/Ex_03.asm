; Aluno: Alyson Deives
; Matricula: 416589

; Implementar um programa para o processador 8085 para
; calcular o resultado da expressão aritmética abaixo,
; usando dados com 8 bits codificados em BCD.
; dado04 = dado01 + dado02 - dado03


;Definição de Dados

dado01: NOP
dado02: NOP
dado03: NOP
dado04: NOP

;Códigos

     LXI H,dado01
     MOV A,M
     INX H
     ADD M
     INX H
     SUB M
     DAA
     STA dado04
     HLT


