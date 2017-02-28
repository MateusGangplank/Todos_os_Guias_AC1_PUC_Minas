// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Guia 13 -Exercicio 04 
// Nome: Ana Cristina P. Teixeira 
// Matricula: 427385

//Implementar um programa para o processador 8085 para
//calcular o resultado da expressão aritmética abaixo,
//usando dados com 8 bits.
//DICA: Usar deslocamento.
//dado03 = dado01 + dado02 * 2

	LXI H,C050
	MOV A,M
	ADD M
	INX H
	RLC
	INX H
	MOV M,A
	HLT