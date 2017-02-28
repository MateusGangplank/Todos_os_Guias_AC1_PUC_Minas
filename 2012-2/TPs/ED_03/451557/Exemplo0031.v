// -------------------------
// Exemplo0031 - F4
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output [3:0] s,
output [3:0] s1,
input [3:0] a,
input [3:0] b);
// descrever por portas
and AND1 (s[0], a[0], b[0]);
and AND1 (s[1], a[1], b[1]);
and AND1 (s[2], a[2], b[2]);
and AND1 (s[3], a[3], b[3]);
or OR1 (s1[0], a[0], b[0]);
or OR1 (s1[1], a[1], b[1]);
or OR1 (s1[2], a[2], b[2]);
or OR1 (s1[3], a[3], b[3]);
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] z;
wire [3:0] k;
f4 modulo (z, k, x, y);
// ------------------------- parte principal
initial begin
$display("Exemplo0031 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Test LU's module");
x = 4'b0011; y = 4'b0101;
// projetar testes do modulo
#1 $display(" (a %3b) (b %3b) (and (a.b) %3b) (or (a+b) %3b)",x,y,z,k);
end
endmodule //test_f4