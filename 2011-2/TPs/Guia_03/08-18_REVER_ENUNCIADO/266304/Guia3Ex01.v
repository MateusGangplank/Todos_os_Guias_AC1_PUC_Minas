// FAVOR REVER O ENUNCIADO (ALTERADO EM 17/08)

// NOME: Afonso de Souza Spinelli - MATRICULA: 266304
// DATA: 17/08/2011

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

module Guia3Ex01;
// ------------------------- definir dados
      reg [4:0] a;
      reg [4:0] b;
      reg [3:0] c;
      reg [3:0] d;
      reg [3:0] e;
 
// ------------------------- parte principal
      initial begin: program

              $display("Guia3Ex01 - Afonso Spinelli - 266304"); //Motra o nome do Exercício na tela.

              a =   2 + 14;       //Cálculo da soma
              b =  3 * 7;         //Cálculo da multiplicacao
              c =  34  / 3;       //Cálculo da divisao
              d =  19 - 11;       //Cálculo da subtracao
              e = 2 * 4 + 6 -1;   //Cálculo da expressao

              //Mostra o resultado das operacoes na tela.
              $display("\n OP = RDec. = RBin.\n");
              $display("a) 2 + 14 = %d = %3b", a, a);
              $display("b) 3 * 7 = %d = %4b", b, b);
              $display("c) 34  / 3 = %d = %5b", c, c);
              $display("d) 19 - 11 = %d = %5b", d, d);
              $display("e) 2 * 4 + 6 -1 = %d = %5b", e, e);

      end
endmodule