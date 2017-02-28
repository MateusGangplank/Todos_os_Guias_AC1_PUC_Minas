// NOME: Afonso de Souza Spinelli - MATRICULA: 266304
// DATA: 17/08/2011

/*Para cada um dos enunciados abaixo,
definir o módulo correspondente e os procedimentos de testes.

04.) Calcular e mostrar o complemento de 2 em binário 
de cada um dos valores abaixo armazenados em registrador(es): 
 
a.) 110101(2)  em 8 bits 
b.) 51(8)      em 7 bits
c.) 11(10)     em 6 bits
d.) B3(16)     em 5 bits
e.) 19 – 25    em 4 bits*/

module Guia3Ex04;
// ------------------------- definir dados
       reg [7:0] a;
       reg [6:0] b;
       reg [5:0] c;
       reg [4:0] d;
       reg [3:0] e;

// ------------------------- parte principal
       initial begin: program

               $display("Guia3Ex04 - Afonso Spinelli - 266304\n"); //Motra o nome do Exercício na tela.

               //Operacao de complemento de 2 em 110101
               a = ~6'b110101 + 1'b1;

               //Mostra o resultado da operacao na tela.
               $display (" a) Complemento de 2 em 110101(2) = Binario: %b = Decimal: %d", a, a);

               //Operacao de complemento de 2 em o51
	       b = ~6'o51 + 1'b1;

	       //Mostra o resultado da operacao na tela.
               $display (" b) Complemento de 2 em 51(8) = Binario: %b = Decimal: %d", b, b);

               //Operacao de complemento de 2 em d11
	       c = ~4'd11 + 1'b1;

	       //Mostra o resultado da operacao na tela.
               $display (" c) Complemento de 2 de 11 = Binario: %b = Decimal: %d", c, c);

               //Operacao de complemento de 2 em hB3
	       d = ~8'hB3 + 1'b1;

	       //Mostra o resultado da operacao na tela.
               $display (" d) Complemento de 2 de B3(16) = Binario: %b = Decimal: %d", d, d);

               //Operacao de complemento de 2 em 19 - 25
	       e = 5'd19 - ((~6'd25) + 1'b1);

	       //Mostra o resultado da operacao na tela.
               $display (" e) Complemento de 2 em 19 - 25 = Binario: %b = Decimal: %d", e, e);
       end
endmodule