// -------------------------
// Exemplo0033 - LU selecionavel
// Nome: Roger Rubens Machado
// Matricula: 430533
// -------------------------
// -------------------------
// LU
// -------------------------
   module LU (output [1:0]s, input a, input b, input chave);

   wire [3:0] c;
   wire [1:0] d;
   wire [1:0] e;

   and AND1(c[0], a, b);
   or  OR1 (c[1], a, b);
   nand NAND1(c[2], a, b);
   nor NOR1(c[3], a, b);
   and AND2(d[0], c[0], ~chave);
   and AND3(d[1], c[1], ~chave);
   and AND4(e[0], c[2], chave);
   and AND5(e[1], c[3], chave);  
   orgate OR2(s, d, e );

   endmodule // LU
   
   module orgate (output [1:0] s, input[1:0] a, input[1:0]b);
          or OR1 (s[0], a[0], b[0]);
          or OR2 (s[1], a[1], b[1]);
   endmodule



   module test_LU;
// ------------------------- definir dados
   reg x, y, chave;
   wire [1:0] z;
   LU modulo (z, x, y, chave);

// ------------------------- parte principal
   initial begin
   $display("Exemplo0033 - Roger Rubens Machado - 430533");
   $display("Test LU's module");
   $display("\n A | B | KEY | OR/AND | NOR/NAND");
   $monitor("%1b    %1b    %1b       %2b ",x,y,chave,z);
          x = 1'b0;   y = 1'b0;   chave = 0;
       #1 x = 1'b0;   y = 4'b1;   chave = 0;
       #1 x = 1'b1;   y = 4'b0;   chave = 0;
       #1 x = 1'b1;   y = 4'b1;   chave = 0;
       #1 x = 1'b0;   y = 1'b0;   chave = 1;
       #1 x = 1'b0;   y = 4'b1;   chave = 1;
       #1 x = 1'b1;   y = 4'b0;   chave = 1;
       #1 x = 1'b1;   y = 4'b1;   chave = 1;

   end
endmodule // test_f4