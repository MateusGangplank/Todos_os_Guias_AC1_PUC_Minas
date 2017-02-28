// ---------------
// Exemplo0094 - Arquitetura de Computador Intel 8085
// Nome Josemar Alves Caetano
// Matrícula 448662
// Data 10/11/2012
// ----------------

// ----------------------- INSTRUCOES ------------
// 
// 1º Colocar manualmente o dado01 na posicao C050
// 2º Colocar manualmente o dado02 na posicao C051
// 3º Colocar manualmente o dado03 na posicao C052
// 
// Obs O resultado (dado04) sera guarado na posicao C053

LXI H,C050
MOV A,M
DAA
INX H
ADD M
DAA
STA C053
INX H
SUB M
DAA
STA C053
HLT
