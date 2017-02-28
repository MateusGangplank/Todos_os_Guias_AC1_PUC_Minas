//Guia 13 - Introducao a linguagem Assembly
//Operacoes aritmeticas com dados de 16 bits com simulador Intel 8085
//Nome - Lucas Siqueira Chagas
//Matricula - 380783
//Exercicio 4
//d3 = 2*d1 + d2 
//d1 - MEM[C050]
//d2 - MEM[C051]
//d3 - MEM[C051]

	LXI H,C050
	MOV A,M
	RLC
	INX H
	ADD M
	INX H
	MOV M,A
	HLT