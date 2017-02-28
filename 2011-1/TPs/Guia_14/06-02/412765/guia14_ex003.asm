                             LXI H,DADO01
                             
                             
                             MOV A,M
                             INX H
                             ADD M
                             INX H
                             SUB M
                             DAA
                             STA DADO04
                             
                             
                             HLT
DADO01 : 
                             NOP
DADO02 : 
                             NOP
DADO03 : 
                             NOP
DADO04 : 
                             NOP
