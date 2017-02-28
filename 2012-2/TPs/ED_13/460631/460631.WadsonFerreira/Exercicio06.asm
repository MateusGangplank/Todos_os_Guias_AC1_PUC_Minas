CARREGAR : 
                             MVI A,0A
                             
                             STA 0090
                             
                             
                             MVI A,04
                             
                             STA 0091
                             
                             
MULTIPLICAR2 : 
                             LDA 0090
                             
                             
                             ADD A
                             STA 0090
                             
                             
MULTIPLICAR3 : 
                             LDA 0091
                             
                             
                             ADD A
                             MVI L,91
                             
                             ADD M
                             STA 0091
                             
                             
SUBTRACAO : 
                             CMA
                             INR A
                             MVI L,90
                             
                             ADD M
                             STA 0092
                             
                             
                             HLT
