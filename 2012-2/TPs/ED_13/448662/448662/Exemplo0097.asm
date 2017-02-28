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
// 
// Obs O resultado (dado03) sera guarado na posicao C053

LXI H,C050
MOV A,M
ADD M
STA C053
INX H
MOV A,M
ADD M
ADD M
MOV B,A
LDA C053
SUB B
STA C053
HLT
