// ---------------------------------- 
// Exemplo0023 - Comparador
// Nome: Rayan Darwin 
// Matricula: 412770
// ---------------------------------- 
`include "util.v"

module compare3 (output [2:0] s, input [2:0] a, input [2:0] b);
       xnor XNOR1(s[0], a[0], b[0]);
       xnor XNOR2(s[1], a[1], b[1]);
       xnor XNOR3(s[2], a[2], b[2]);
endmodule

module test_comparador;
// ------------------------- definir dados
reg [2:0]x;
reg [2:0]y;
wire [2:0] s;

compare3 COMP1 (s, x, y);
// ------------------------- parte principal
initial begin
$display("Exemplo0023 - Rayan Darwin - 412770");
$display("Test ALU’s comparador de igualdade 3 bits");

x = 3'b000; y = 3'b000;
$display("A   | B   |  Resultado");
// projetar testes do somador complete
$monitor("%3b %3b = %3b", x, y,  s);
#1 x = 3'b000; y = 3'b000;
#1 x = 3'b010; y = 3'b010;
#1 x = 3'b111; y = 3'b011;
#1 x = 3'b110; y = 3'b001;
#1 x = 3'b111; y = 3'b010;
end
endmodule // test_comparador