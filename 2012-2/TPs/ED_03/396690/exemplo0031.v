// -------------------------
// Exemplo0031 - F4
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module f4 (output [3:0] s0,output [3:0] s1,input [3:0] a,input [3:0] b);
// descrever por portas
and AND1(s0[0], a[0], b[0]);
and AND2(s0[1], a[1], b[1]);
and AND3(s0[2], a[2], b[2]);
and AND4(s0[3], a[3], b[3]);
or OR1(s1[0], a[0], b[0]);
or OR1(s1[1], a[1], b[1]);
or OR1(s1[2], a[2], b[2]);
or OR1(s1[3], a[3], b[3]);
endmodule // f4

module test_f4;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] z;
wire [3:0] w;
f4 modulo (z, w, x, y);
// ------------------------- parte principal

initial begin
$display("Exemplo0031 - Gabriel Benjamim de Carvalho - 396690");
$display("Test LU's module");
x = 4'b0011; y = 4'b0101;
// projetar testes do modulo
#1 $display("x y -> 		x AND y - x OR y");
#1 $display("%3b %3b 	%3b 	  %3b",x,y,z,w);
x = 4'b1011; y = 4'b0011;
#1 $display("%3b %3b 	%3b 	  %3b",x,y,z,w);
end
endmodule // test_f4