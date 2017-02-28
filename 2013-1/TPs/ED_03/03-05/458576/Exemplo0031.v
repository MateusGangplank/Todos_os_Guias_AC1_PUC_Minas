// -------------------------
// Exemplo0031 - F4
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output [3:0] s1,
output [3:0] s2,
input [3:0] a,
input [3:0] b);

and AND1 (s1[0], a[0], b[0]);
and AND1 (s1[1], a[1], b[1]);
and AND1 (s1[2], a[2], b[2]);
and AND1 (s1[3], a[3], b[3]);
or OR1 (s2[0], a[0], b[0]);
or OR1 (s2[1], a[1], b[1]);
or OR1 (s2[2], a[2], b[2]);
or OR1 (s2[3], a[3], b[3]);
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] z0;
wire [3:0] z1;
f4 modulo (z0, z1, x, y);
// ------------------------- parte principal
initial begin
$display("Exemplo0031 - xxx yyy zzz - 999999");
$display("Test LU's module");
x = 4'b0011; y = 4'b0101;
// projetar testes do modulo
#1 $display("%3b %3b %3b %3b",x,y,z0, z1);
end
endmodule // test_f4