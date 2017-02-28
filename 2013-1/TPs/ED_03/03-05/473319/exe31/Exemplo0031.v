// -------------------------
// Exemplo0031 - F4
// Nome: Adamo Ludwig
// Matricula: 473319
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4 (output [3:0] s,output [3:0] g,
input [3:0] a,
input [3:0] b);

wire exe31[0:1];

and AND1(exe31[0], a, b);
or OR1(exe31[1], a, b);

assign s = exe31[0];
assign g = exe31[1];

// descrever por portas

endmodule // f4

module test_f4;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] z;

f4 modulo (z, x, y);

// ------------------------- parte principal

initial begin
$display("Exemplo0031 - Adamo Ludwig - 473319");
$display("Test LU's module");

x = 4'b0011;

// projetar testes do modulo
#1 $display("%3b %3b %3b",x,y,z);

end

endmodule // test_f4
