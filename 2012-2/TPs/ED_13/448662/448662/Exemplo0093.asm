// ---------------
// Exemplo0093 - Arquitetura de Computador Intel 8085
// Nome Josemar Alves Caetano
// Matrícula 448662
// Data 03/11/2012
// ----------------

// ----------------------- INSTRUCOES ------------
// 
// 1º Colocar manualmente o dado01 na posicao C050
// 2º Colocar manualmente o dado02 na posicao C051
// 3º Colocar manualmente o dado03 na posicao C052
// 
// Obs O resultado (dado04) sera guarado na posicao C053

LDA C051
CMA
INR A //Calcula complemento de dois de C051
MOV B,A
LDA C050
ADD B
STA C053
MOV B,A
LDA C052
CMA
INR A //Calcula complemento de dois de C052
MOV C,A
MOV A,B
ADD C
STA C053
HLT
