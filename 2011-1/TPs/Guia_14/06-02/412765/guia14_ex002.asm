                             LXI H,DADO01L
                             
                             
                             MOV A,M
                             LXI H,DADO02L
                             
                             
                             ADD M
                             MOV C,A
                             MVI D,00
                             
                             JNC LABEL01
                             
                             
                             MVI D,01
                             
LABEL01 : 
                             LXI H,DADO01H
                             
                             
                             MOV A,M
                             LXI H,DADO02H
                             
                             
                             ADD M
                             ADD D
                             MOV B,A
                             MOV A,C
                             LXI H,DADO03L
                             
                             
                             SUB M
                             MOV C,A
                             MVI D,00
                             
                             JNS C025LABEL02
                             MVI D,01
                             
LABEL02 : 
                             MOV A,B
                             LXI H,DADO03H
                             
                             
                             SUB M
                             SUB D
                             MOV B,A
                             MOV A,B
                             STA DADO04H
                             
                             
                             MOV A,C
                             STA DADO04L
                             
                             
                             HLT
DADO01H : 
                             NOP
DADO01L : 
                             NOP
DADO02H : 
                             NOP
DADO02L : 
                             NOP
DADO03H : 
                             NOP
DADO03L : 
                             NOP
DADO04H : 
                             NOP
DADO04L : 
                             NOP
