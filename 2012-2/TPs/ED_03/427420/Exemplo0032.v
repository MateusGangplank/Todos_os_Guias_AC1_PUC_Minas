// -------------------------
// Exemplo0032 - LU selecionavel
// Nome: Jenifer Henrique
// Matricula: 427420
// -------------------------
// -------------------------
// LU
// -------------------------
   module LU (output s, input a, input b, input key);
   
   wire [1:0] c, d;
   
   // descrever por portas
   and AND1(c[0], a, b);
   or  OR1 (d[0], a, b);
   
   and AND2(c[1], c[0], key);
   and AND3(d[1], d[0], ~key);

   or OR2(s, c[1], d[1]);

   endmodule // f4

   module test_LU;
// ------------------------- definir dados
   reg x, y, key;
   LU modulo (z, x, y, key);

// ------------------------- parte principal
   initial begin
   $display("Exemplo0032 - Jenifer Henrique - 427420");
   $display("Test LU's module");
   $display("\n A | B | KEY | Resultado");
   $monitor("%1b    %1b    %1b    %1b ",x,y,key,z);
   
       //projetar testes do modulo
          x = 1'b0;   y = 1'b0;   key = 0;
       #1 x = 1'b0;   y = 4'b1;   key = 0;
       #1 x = 1'b1;   y = 4'b0;   key = 0;
       #1 x = 1'b1;   y = 4'b1;   key = 0;
       
       #1 x = 1'b0;   y = 1'b0;   key = 1;
       #1 x = 1'b0;   y = 4'b1;   key = 1;
       #1 x = 1'b1;   y = 4'b0;   key = 1;
       #1 x = 1'b1;   y = 4'b1;   key = 1;

   end
endmodule // test_f4