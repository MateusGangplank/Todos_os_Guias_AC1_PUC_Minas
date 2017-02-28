// NOME: Afonso de Souza Spinelli - MATRICULA: 266304
// DATA: 10/08/2011

/*Para cada um dos enunciados abaixo,
definir o módulo correspondente e os procedimentos de testes. 
 
03.) Calcular e mostrar o complemento de 2 
     de cada um dos valores abaixo armazenados em registrador(es):
 
a.) 100111(2)  
b.) 54(8) 
c.) 13(10) 
d.) 1B(16) 
e.) 25 - 36 */

module Guia2Ex03;
// ------------------------- definir dados
       reg [4:0] a;
       reg [4:0] b;
       reg [5:0] c;
       reg [6:0] d;
       reg [9:0] e;

// ------------------------- parte principal
       initial begin: program

               $display("Guia2Ex03 - Afonso Spinelli - 266304\n"); //Motra o nome do Exercício na tela.

               //Operacao de complemento de 2 em 100111
               a = ~6'b100111 + 1'b1;

               //Mostra o resultado da operacao na tela.
               $display (" a) Complemento de 2 de 100111(2)= Binario: %b = Decimal: %d", a, a);

               //Operacao de complemento de 2 em o54
	       b = ~6'o54 + 1'b1;

	       //Mostra o resultado da operacao na tela.
               $display (" b) Complemento de 2 de 100111(2)= Binario: %b = Decimal: %d", b, b);

               //Operacao de complemento de 2 em d13
	       c = (~4'd13) + 1'b1;

	       //Mostra o resultado da operacao na tela.
               $display (" c) Complemento de 2 de 100111(2)= Binario: %b = Decimal: %d", c, c);

               //Operacao de complemento de 2 em h1B
	       d = ~5'h1B + 1'b1;
	       
	       //Mostra o resultado da operacao na tela.
               $display (" d) Complemento de 2 de 100111(2)= Binario: %b = Decimal: %d", d, d);

               //Operacao de complemento de 2 em 25 - 36
	       e = 5'd25 + ((~6'd36) + 1'b1);
	       
	       //Mostra o resultado da operacao na tela.
               $display (" e) Complemento de 2 de 100111(2)= Binario: %b = Decimal: %d", e, e);
       end
endmodule

