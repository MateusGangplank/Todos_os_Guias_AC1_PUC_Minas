// NOME: Afonso de Souza Spinelli - MATRICULA: 266304
// DATA: 10/08/2011

/*Para cada um dos enunciados abaixo,
definir o módulo correspondente e os procedimentos de testes. 
 
01.) Executar as operações abaixo, 
     armazenar seus dados e resultados em registradores
     e mostrar os valores resultantes em binário,
     com a menor quantidade de bits necessária:
 
a.) 2   + 14
b.) 3   *   7 
c.) 34  /  3
d.) 19 – 11 
e.) 2 * 4 + 6 - 1 */

module Guia2Ex01_v2;
// ------------------------- definir dados
       reg [5:0] M1, M2, M3, M4, M5;

// ------------------------- parte principal
       initial begin: program

               $display ("Guia2Ex01_v2\n"); //Motra o nome do Exercício na tela.

               M1 = 8'b00000010;   //M1 = 2
               M2 = 8'b00001110;   //M2 = 14
               M3 = 8'b00000000;   //M3 = resultado

               M3 = M1 + M2;  //Cálculo da soma
               
               //Mostra o resultado da operação na tela nos varios formatos.
               $display (" a) 2 + 14 = Binario: %b = Octal: %o = Decimal: %d = Hex-decimal: %h", M3, M3, M3,M3);

               M1 = 4'b0011;   //M1 = 3
               M2 = 4'b0111;   //M2 = 7
               M3 = 4'b0000;   //M3 = resultado

               M3 = M1 * M2;  //Cálculo da multiplicacao
               //Mostra o resultado da operação na tela nos varios formatos.
               $display (" b) 3 * 7 = Binario: %b = Octal: %o = Decimal: %d = Hex-decimal: %h", M3, M3, M3,M3);
               
               M1 = 8'b00100010;   //M1 = 34
               M2 = 8'b00000011;   //M2 = 3
               M3 = 8'b00000000;   //M3 = resultado

               M3 = M1 / M2;  //Cálculo da divisao
               //Mostra o resultado da operação na tela nos varios formatos.
               $display (" c) 34  / 3 = Binario: %b = Octal: %o = Decimal: %d = Hex-decimal: %h", M3, M3, M3,M3);
               
               M1 = 8'b00010011;   //M1 = 19
               M2 = 8'b00001011;   //M2 = 11
               M3 = 8'b00000000;   //M3 = resultado

               M3 = M1 - M2;  //Cálculo da subtracao
               //Mostra o resultado da operação na tela nos varios formatos.
               $display (" d) 19  - 11 = Binario: %b = Octal: %2o = Decimal: %d = Hex-decimal: %h", M3, M3, M3,M3);

               M1 = 8'b00000010;   //M1 = 2
               M2 = 8'b00000100;   //M2 = 4
               M3 = 8'b00000110;   //M3 = 6
               M4 = 8'b00000001;   //M4 = 1
               M5 = 8'b00000000;   //M5 = resultado

               M5 = M1 * M2 + M3 - M4;  //Cálculo da expressao
               //Mostra o resultado da operação na tela nos varios formatos.
               $display (" e) 2 * 4 + 6 - 1 = Binario: %b = Octal: %2o = Decimal: %d = Hex-decimal: %h", M5, M5, M5,M5);
       end
endmodule

