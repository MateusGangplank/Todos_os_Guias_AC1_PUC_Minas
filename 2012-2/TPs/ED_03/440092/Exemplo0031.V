// -------------------------
// Exemplo0031 - F4
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output [3:0] s,output [3:0] s1,
input [3:0] a,
input [3:0] b);
assign s1 = a | b;
assign s = a & b;
// descrever por portas
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] z;
wire [3:0] r;
f4 modulo (z, r, x, y);
// ------------------------- parte principal
initial begin
$display("Exemplo0031 - Ailton Gomes - 440092");
$display("Test LU's module"   );
x = 4'b0011; y = 4'b0101;
// projetar testes do modulo
#1 $display("%3b %3b = (and)%3b  (or)%3b",x,y,z, r);
end
endmodule // test_f4