// NOME: Afonso de Souza Spinelli - MATRICULA: 266304
// DATA: 17/08/2011

/*Para cada um dos enunciados abaixo,
definir o módulo correspondente e os procedimentos de testes.

05.) Calcular e mostrar o complemento de 2 nas bases indicadas para 
cada um dos valores abaixo armazenados em registrador(es): 
 
f.) 10001(2)   em 8 bits  base 10
g.) 64(8)      em 7 bits  base  8
h.) 14(10)     em 6 bits  base 16
i.) C4(16)     em 5 bits  base  8
j.) 28 – 35    em 4 bits  base 16
 */

module Guia3Ex05;
// ------------------------- definir dados
       reg [7:0] a;
       reg [6:0] b;
       reg [5:0] c;
       reg [4:0] d;
       reg [3:0] e;

// ------------------------- parte principal
       initial begin: program

               $display("Guia3Ex04 - Afonso Spinelli - 266304\n"); //Motra o nome do Exercício na tela.

               //Operacao de complemento de 2 em 10001
               a = ~5'b10001 + 1'b1;

               //Mostra o resultado da operacao na tela.
               $display (" a) Complemento de 2 em 10001(2) = Binario: %b = Decimal: %d", a, a);

               //Operacao de complemento de 2 em o64
	       b = ~6'o64 + 1'b1;

	       //Mostra o resultado da operacao na tela.
               $display (" b) Complemento de 2 em 64(8) = Binario: %b = Octal: %o", b, b);

               //Operacao de complemento de 2 em d14
	       c = ~4'd14 + 1'b1;

	       //Mostra o resultado da operacao na tela.
               $display (" c) Complemento de 2 de 14 = Binario: %b = Hexadecimal: %h", c, c);

               //Operacao de complemento de 2 em hC4
	       d = ~8'hC4 + 1'b1;

	       //Mostra o resultado da operacao na tela.
               $display (" d) Complemento de 2 de B3(16) = Binario: %b = Octal: %o", d, d);

               //Operacao de complemento de 2 em 28 - 35
	       e = 5'd28 - ((~6'd35) + 1'b1);

	       //Mostra o resultado da operacao na tela.
               $display (" e) Complemento de 2 em 28 - 35 = Binario: %b = Hexadecimal: %h", e, e);
       end
endmodule