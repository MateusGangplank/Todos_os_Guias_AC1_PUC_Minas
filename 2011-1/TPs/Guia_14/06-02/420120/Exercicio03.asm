;Nome: Isabella Gon�ales
;Matricula: 420120

; usando dados com 8 bits codificados em BCD.
; Fa�a: dado04 = dado01 + dado02 - dado03


;C�digos
     LXI H,dado01
     MOV A,M
     INX H
     ADD M
     INX H
     SUB M
     DAA
     STA dado04
     HLT

;Dados

dado01: @EQU 000D
dado02: @EQU 000E
dado03: @EQU 000F
dado04: @EQU 0010
