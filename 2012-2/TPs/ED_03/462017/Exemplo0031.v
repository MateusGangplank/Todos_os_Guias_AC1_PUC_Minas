// -------------------------
// Exemplo0031 - LU
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// -------------------------
// -------------------------
// LU_gate
// -------------------------
module andgate (output [3:0] s, input [3:0] a, input [3:0] b);
   and AND1 (s[0], a[0], b[0]);
   and AND2 (s[1], a[1], b[1]);
   and AND3 (s[2], a[2], b[2]);
   and AND4 (s[3], a[3], b[3]);
endmodule

module orgate (output [3:0] s, input [3:0] a, input [3:0] b);
   or OR1 (s[0], a[0], b[0]);
   or OR2 (s[1], a[1], b[1]);
   or OR3 (s[2], a[2], b[2]);
   or OR4 (s[3], a[3], b[3]);
endmodule

module test_LU;
// ------------------------- definir dados
   reg [3:0] x;
   reg [3:0] y;
   wire [3:0] z1;
   wire [3:0] z2;
   andgate modulo1 (z1, x, y);
   orgate modulo2 (z2, x, y);

// ------------------------- parte principal
initial begin
   $display("Exemplo0031 - Breno Macena - 462017");
   $display("Test LU's module");
   x = 4'b0011; y = 4'b0101;
// projetar testes do modulo
   #1 $display("%3b %3b %3b",x,y,z1);
   #1 $display("%3b %3b %3b",x,y,z2);
end
endmodule // test_LU