CARREGAR : 
                             MVI A,E0
                             
                             STA 0090
                             
                             
                             MVI A,08
                             
                             STA 0091
                             
                             
MULTIPLICAR : 
                             MVI L,91
                             
                             MOV A,M
                             STC
                             CMC
                             RAL
                             MVI L,92
                             
                             MOV M,A
SOMAR : 
                             MVI L,90
                             
                             ADD M
                             MVI L,92
                             
                             MOV M,A
                             HLT
