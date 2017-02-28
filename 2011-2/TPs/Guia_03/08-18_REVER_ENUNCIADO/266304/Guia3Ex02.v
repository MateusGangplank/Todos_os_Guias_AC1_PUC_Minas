// NOME: Afonso de Souza Spinelli - MATRICULA: 266304
// DATA: 17/08/2011

/*Para cada um dos enunciados abaixo,
definir o módulo correspondente e os procedimentos de testes. 
 
02.) Executar as operações abaixo, 
     armazenar seus dados e resultados em registradores
     e mostrar os valores resultantes em binário,
     com a menor quantidade de bits necessária: 
 
a.) 100010(2) + 11010(2) 
b.) 11010(2) + 23(8) 
c.) 1234(8)  /  2D(16)
d.) 1A9(16) – 101101001(2)
e.) 25 * 41(8) + 6B(16) */

module Guia3Ex02;
// ------------------------- definir dados
       reg [5:0] a;
       reg [5:0] b;
       reg [5:0] c;
       reg [6:0] d;
       reg [9:0] e;

// ------------------------- parte principal
       initial begin: program

               $display("Guia3Ex02 - Afonso Spinelli - 266304\n"); //Motra o nome do Exercício na tela.

                   //b100010 = 34       b11010 = 26
               a = 6'b100010 + 5'b11010; //Calculo da soma
               
               //Mostra o resultado da operacao na tela nos varios formatos.
               $display (" a) 100010(2) + 11010(2)= Binario: %b = Decimal: %d ", a, a);

                    //b11010 = 26      o23 = 19
               b = 5'b11010 + 5'o23;  //Calculo da soma

               //Mostra o resultado da operacao na tela nos varios formatos.
               $display (" b) 11010(2) + 23(8) = Binario: %b = Decimal: %d ", b, b);
               
               //o1234 = 668   //h2D = 45
               c = 10'o1234 / 6'h2D; //Calculo da divisao

               //Mostra o resultado da operacao na tela nos varios formatos.
               $display (" c) 1234(8)  /  2D(16) = Binario: %b = Decimal: %d ", c, c);
               
               //h1A9 = 425   //b101101001 = 361
               d = 9'h1A9 - 9'b101101001; //Calculo da subtracao

               //Mostra o resultado da operacao na tela nos varios formatos.
               $display (" d) 1A9(16) – 101101001(2) = Binario: %b = Decimal: %d ", d, d);
               
                   //25  //o41 = 33 //h6B = 107
               e = 25 * 6'o41 + 7'h6B; //Calculo da subtracao

               //Mostra o resultado da operacao na tela nos varios formatos.
               $display (" e) 25 * 41(8) + 6B(16) = Binario: %b = Decimal: %d ", e, e);
       end
endmodule 