                             MVI A,04
                             
                             STA C071
                             
                             
                             MVI A,01
                             
                             STA C072
                             
                             
                             LDA C072
                             
                             
                             MVI L,71
                             
                             MVI H,C0
                             
                             ADD M
                             ADD A
                             STA C073
                             
                             
                             HLT
