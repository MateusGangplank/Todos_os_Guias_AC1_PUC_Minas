//Guia 13 - Introducao a linguagem Assembly
//Operacoes aritmeticas com dados de 16 bits com simulador Intel 8085
//Nome - Mateus Guilherme do Carmo Cruz
//Matricula - 427446
//Mateus Guilherme do Carmo Cruz
//Exercicio 2
//d4 = d1 - d2 + d3
//d1 - MEM[C050](L) - MEM[C051](H)
//d2 - MEM[C052](L) - MEM[C053](H)
//d3 - MEM[C054](L) - MEM[C055](H)
//d4 - MEM[C056](L) - MEM[C057](H) - MEM[C058] (carry)

	LHLD C050
	XCHG
	LHLD C052
	LXI B,0000
	MOV A,L
	CMA
	MOV L,A
	MOV A,H
	CMA
	MOV H,A
	INX H
	DAD D
	JNC AHEAD
	INX B
AHEAD:	XCHG
	LHLD C054
	DAD D
	SHLD C056
	HLT