CARREGAR : 
                             MVI A,00
                             
                             STA 0090
                             
                             
                             MVI A,03
                             
                             STA 0091
                             
                             
                             MVI A,00
                             
                             STA 0092
                             
                             
                             MVI A,01
                             
                             STA 0093
                             
                             
                             MVI A,00
                             
                             STA 0094
                             
                             
                             MVI A,01
                             
                             STA 0095
                             
                             
MAIN : 
                             MVI L,93
                             
                             CALL COMPLEMENTAR
                             
                             
                             LDA 0093
                             
                             
                             MVI L,91
                             
                             ADD M
                             JNC SOMAALTA
                             
                             
                             INR C
                             JMP SOMAALTA
                             
                             
SOMAALTA : 
                             STA 0097
                             
                             
                             LDA 0092
                             
                             
                             MVI L,90
                             
                             ADD M
                             ADD C
                             STA 0096
                             
                             
                             MVI C,00
                             
                             MVI L,95
                             
                             CALL COMPLEMENTAR
                             
                             
                             LDA 0097
                             
                             
                             MVI L,95
                             
                             ADD M
                             JNC SOMAFINAL
                             
                             
                             INR C
                             JMP SOMAFINAL
                             
                             
SOMAFINAL : 
                             STA 0097
                             
                             
                             LDA 0096
                             
                             
                             MVI L,94
                             
                             ADD M
                             ADD C
                             STA 0096
                             
                             
                             HLT
COMPLEMENTAR : 
                             STC
                             CMC
                             MVI C,00
                             
                             MOV A,M
                             CMA
                             INR A
                             JNC COMPLEMENTAR2
                             
                             
                             INR C
                             JMP COMPLEMENTAR2
                             
                             
COMPLEMENTAR2 : 
                             MOV M,A
                             DCR L
                             MOV A,M
                             CMA
                             ADD C
                             MOV M,A
                             MVI C,00
                             
                             RET
