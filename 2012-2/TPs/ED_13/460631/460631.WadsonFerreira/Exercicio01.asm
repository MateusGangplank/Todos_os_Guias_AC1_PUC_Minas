CARREGAR : 
                             MVI A,10
                             
                             STA 0090
                             
                             
                             MVI A,01
                             
                             STA 0091
                             
                             
                             MVI A,07
                             
                             STA 0092
                             
                             
SOMAR : 
                             LDA 0090
                             
                             
                             MVI L,91
                             
                             ADD M
SUBTRAIR : 
                             MVI L,92
                             
                             SUB M
                             STA 0093
                             
                             
                             HLT
