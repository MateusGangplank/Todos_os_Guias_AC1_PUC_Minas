// ---------------
// Exemplo0097 - Arquitetura de Computador Intel 8085
// Nome Josemar Alves Caetano
// Matrícula 448662
// Data 10/11/2012
// ----------------

// ----------------------- INSTRUCOES ------------
// 
// 1º Colocar manualmente o dado01 na posicao C050
// 2º Colocar manualmente o dado02 na posicao C051
// 3º Colocar manualmente o valor 02 na posicao C052	
// 
// Obs O resultado (dado03) sera guarado na posicao C053

LXI H,C052
MOV B,M
LDA C050
SUB B
JC C00E
JNC C007
ADD B
STA C053
LDA C051
RAR //Desloca os bits do acumulador para a direita um vez
//CMA 
//INR A
MOV C,A
LDA C053
ADD C
STA C053
HLT
