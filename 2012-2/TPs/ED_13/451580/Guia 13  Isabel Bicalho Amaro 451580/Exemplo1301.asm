                             MVI A,04
                             
                             STA C071
                             
                             
                             MVI A,02
                             
                             STA C072
                             
                             
                             MVI A,03
                             
                             STA C073
                             
                             
                             LDA C071
                             
                             
                             MVI L,72
                             
                             MVI H,C0
                             
                             ADD M
                             MVI L,73
                             
                             MVI H,C0
                             
                             SUB M
                             STA C074
                             
                             
                             HLT
