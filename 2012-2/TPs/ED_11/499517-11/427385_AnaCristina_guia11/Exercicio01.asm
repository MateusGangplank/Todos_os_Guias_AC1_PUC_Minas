// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Guia 13 -Exercicio 01 
// Nome: Ana Cristina P. Teixeira 
// Matricula: 427385

//Implementar um programa para o processador 8085 para
//calcular o resultado da expressão aritmética abaixo,
//usando dados com 8 bits.
//dado04 = dado01 + dado02 - dado03

     LXI H,dado01
     MOV A,M
     INX H
     ADD M
     INX H
     SUB M
     STA dado04
     HLT