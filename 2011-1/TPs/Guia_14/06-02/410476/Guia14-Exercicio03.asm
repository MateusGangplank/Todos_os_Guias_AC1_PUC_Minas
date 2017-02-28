;Larissa Fernandes Leijoto - 410476


;CODIGOS


     LXI H,dado01
     MOV A,M
     INX H
     ADD M
     INX H
     SUB M
     DAA
     STA dado04
     HLT

;DADOS


dado01: @EQU 000D
dado02: @EQU 000E
dado03: @EQU 000F
dado04: @EQU 0010
