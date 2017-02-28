//Guia 13 - Introducao a linguagem Assembly
//Operacoes aritmeticas com dados de 16 bits em BCD com simulador Intel 8085
//Nome - Lucas Siqueira Chagas
//Matricula - 380783
//Exercicio 1
//d3 = 2*d1 +  3*d2
//d1 = MEM[C050]
//d2 = MEM[C051]
//d3 = MEM[C052]

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