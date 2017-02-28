                             MVI A,15
                             
                             STA C071
                             
                             
                             MVI A,12
                             
                             STA C072
                             
                             
                             MVI A,13
                             
                             STA C073
                             
                             
                             LDA C071
                             
                             
                             MVI L,72
                             
                             MVI H,C0
                             
                             ADD M
                             DAA
                             MVI L,73
                             
                             MVI H,C0
                             
                             SUB M
                             DAA
                             STA C074
                             
                             
                             HLT
