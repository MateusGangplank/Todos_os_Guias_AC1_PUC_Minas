// -------------------------
// Exemplo0034 - LU selecionavel
// Nome: Roger Rubens Machado
// Matricula: 430533
// -------------------------
// -------------------------
// LU
// -------------------------
   module LU (output s, input a, input b, input [1:0] chave);

   wire [3:0] c;
   wire [3:0] d;
   xor XOR1(c[0], a, b);
   xnor XNOR1(c[1], a, b);
   nor NOR1(c[2], a, b);
   or OR1(c[3], a, b);
   and AND1(d[0], c[0], ~chave[0], chave[1]);
   and AND2(d[1], c[1], chave[0], chave[1]);
   and AND3(d[2], c[2], chave[0], ~chave[1]);
   and AND4(d[3], c[3], ~chave[0], ~chave[1]);
   orgate4 OR(s, d );

   endmodule // LU

   module orgate4 ( output s, input [3:0] p);
          wire y, z;
          or OR1 (y, p[0], p[1]);
          or OR2 (z, p[2], p[3]);

          assign s = y | z;
   endmodule // orgate

   module test_LU;
// ------------------------- definir dados
   reg x, y;
   reg [1:0] chave;

   LU modulo (z, x, y, chave);

// ------------------------- parte principal
   initial begin
   $display("Exemplo0033 - Roger Rubens Machado - 430533");
   $display("Test LU's module");
   $display("\n A | B | Key | Resultado");
   $monitor("%1b    %1b    %1b       %2b ",x,y,chave,z);
          x = 1'b0;   y = 1'b0;   chave = 2'b00;
       #1 x = 1'b0;   y = 1'b1;   chave = 2'b00;
       #1 x = 1'b1;   y = 1'b0;   chave = 2'b00;
       #1 x = 1'b1;   y = 1'b1;   chave = 2'b00;
       #1 x = 1'b0;   y = 1'b0;   chave = 2'b01;
       #1 x = 1'b0;   y = 1'b1;   chave = 2'b01;
       #1 x = 1'b1;   y = 1'b0;   chave = 2'b01;
       #1 x = 1'b1;   y = 1'b1;   chave = 2'b01; 
       #1 x = 1'b0;   y = 1'b0;   chave = 2'b10;
       #1 x = 1'b0;   y = 1'b1;   chave = 2'b10;
       #1 x = 1'b1;   y = 1'b0;   chave = 2'b10;
       #1 x = 1'b1;   y = 1'b1;   chave = 2'b10;
       #1 x = 1'b0;   y = 1'b0;   chave = 2'b11;
       #1 x = 1'b0;   y = 1'b1;   chave = 2'b11;
       #1 x = 1'b1;   y = 1'b0;   chave = 2'b11;
       #1 x = 1'b1;   y = 1'b1;   chave = 2'b11;

   end
endmodule // test_f4