// ---------------
// Exemplo0095 - Arquitetura de Computador Intel 8085
// Nome Josemar Alves Caetano
// Matrícula 448662
// Data 05/11/2012
// ----------------

// ----------------------- INSTRUCOES ------------
// 
// 1º Colocar manualmente o dado01 na posicao C050
// 2º Colocar manualmente o dado02 na posicao C051
// 
// Obs O resultado (dado03) sera guarado na posicao C053

LXI H,C051
MOV A,M
ADD A
STA C053
DCX H
ADD M
STA C053
HLT
