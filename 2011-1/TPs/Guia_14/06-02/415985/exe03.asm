;Bruno César Lopes Silva - 415985
;Guia 14 - Exe03	

     LXI H,d01
     MOV A,M
     INX H
     ADD M
     INX H
     SUB M
     DAA
     STA d04
     HLT

d01: @EQU 000D
d02: @EQU 000E
d03: @EQU 000F
d04: @EQU 0010
