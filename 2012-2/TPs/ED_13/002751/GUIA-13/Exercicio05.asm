//--------------------------------------------------------------
//Guia 13 -Exercicio 05
//simulador Intel 8085
//Nome - Milton costa teles da silva - 002751
//--------------------------------------------------------------

//Implementar um programa para o processador 8085 para
//calcular o resultado da expressão aritmética abaixo,
//usando dados com 8 bits.
//DICA: Somar o acumulador com ele mesmo.
//dado03 = 2 * (dado01 + dado02)

	LXI H,C050
	MOV A,M
	RLC
	MOV D,A
	INX H
	MOV A,M
	RLC
	ADD M
	ADD D
	INX H
	MOV M,A
	HLT