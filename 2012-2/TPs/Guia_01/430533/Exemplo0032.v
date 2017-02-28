// -------------------------
// Exemplo0032 - LU selecionavel
// Nome: Roger Rubens Machado
// Matricula: 430533
// -------------------------
// -------------------------
// LU
// -------------------------
   module LU (output s, input a, input b, input chave);
   
   wire [1:0] c, d;
	
   and AND1(c[0], a, b);
   or  OR1 (d[0], a, b);
   and AND2(c[1], c[0], chave);
   and AND3(d[1], d[0], ~chave);
   or OR2(s, c[1], d[1]);

   endmodule // f4

   module test_LU;
// ------------------------- definir dados
   reg x, y, chave;
   LU modulo (z, x, y, chave);

// ------------------------- parte principal
   initial begin
   $display("Exemplo0032 - Roger Rubens Machado - 430533");
   $display("Test LU's module");
   $display("\n A | B | KEY | Resultado");
   $monitor("%1b    %1b    %1b    %1b ",x,y,chave,z);
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