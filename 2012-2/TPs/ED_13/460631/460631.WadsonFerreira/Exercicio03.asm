CARREGAR : 
                             MVI A,40
                             
                             STA 0090
                             
                             
                             MVI A,38
                             
                             STA 0091
                             
                             
                             MVI A,30
                             
                             STA 0092
                             
                             
SOMAR : 
                             LDA 0090
                             
                             
                             MVI L,91
                             
                             ADD M
                             DAA
SUBTRAIR : 
                             MVI L,92
                             
                             SUB M
                             DAA
                             STA 0093
                             
                             
                             HLT
