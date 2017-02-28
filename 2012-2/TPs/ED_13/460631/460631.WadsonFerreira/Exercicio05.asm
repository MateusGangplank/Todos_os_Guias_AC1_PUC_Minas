CARREGAR : 
                             MVI A,E0
                             
                             STA 0090
                             
                             
                             MVI A,08
                             
                             STA 0091
                             
                             
SOMAR : 
                             LDA 0090
                             
                             
                             MVI L,91
                             
                             ADD M
                             ADD A
                             STA 0092
                             
                             
                             HLT
