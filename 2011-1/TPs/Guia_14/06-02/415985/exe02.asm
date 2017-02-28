;Bruno César Lopes Silva 415985
;Guia 14 - exe02


     LXI H,d01L
     MOV A,M
     LXI H,d02L
     ADD M
     MOV C,A

     MVI D,00h
     JNC LABEL01
     MVI D,01h

LABEL01:

     LXI H,d01H
     MOV A,M
     LXI H,d02H
     ADD M
     ADD D
     MOV B,A
     MOV A,C
     LXI H,d03L
     SUB M
     MOV C,A

     MVI D,00h
     JNS LABEL02
     MVI D,01h

LABEL02:
     MOV A,B
     LXI H,d03H
     SUB M
     SUB D
     MOV B,A
     MOV A,B
     STA d04H
     MOV A,C
     STA d04L

     HLT


d01H: @EQU 0035
d01L: @EQU 0036
d02H: @EQU 0037
d02L: @EQU 0038
d03H: @EQU 0039
d03L: @EQU 003A
d04H: @EQU 003B