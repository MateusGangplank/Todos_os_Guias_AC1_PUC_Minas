// ---------------
// Exemplo0092 - Arquitetura de Computador Intel 8085
// Nome Josemar Alves Caetano
// Matr�cula 448662
// Data 03/11/2012
// ----------------

// ----------------------- INSTRUCOES ------------
// 
// 1� Colocar manualmente o dado01 na posicao C050
// 2� Colocar manualmente o dado02 na posicao C051
// 3� Colocar manualmente o dado03 na posicao C052
// 
// Obs O resultado (dado04) sera guarado na posicao C053

LXI H,C050
MOV A,M
INX H
ADD M
STA C054
INX H
SUB M
STA C054
HLT
