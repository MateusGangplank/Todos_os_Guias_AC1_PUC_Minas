// -------------------------
// Exercio0002 – FULL SUBTRACTOR
// Nome: Jenifer Henrique
// Matricula: 427420
// -------------------------
// -------------------------
//  full subtractor 3 bits
// -------------------------
`include "util.v"

module fullSub3 (output [3:0] s, input [2:0] a, input [2:0] b);
       wire x, y;
       halfSub HS1 (s[0], x, a[0], b[0]);
       fullSub FS1 (s[1], y, a[1], b[1], x);
       fullSub FS2 (s[2], s[3], a[2], b[2], y);

endmodule

module test_fullSub;
// ------------------------- definir dados
reg [2:0]x;
reg [2:0]y;
wire [3:0] s;

fullSub3 FS3 (s, x, y);
// ------------------------- parte principal
initial begin
$display("Exercicio02 - Jenifer Henrique - 427420");
$display("Test ALU’s full subtractor 3 bits");

x = 3'b000; y = 3'b000;
$display("A   | B   |  Resultado");
// projetar testes do somador complete
$monitor("%3b %3b = %4b", x, y,  s);
#1 x = 3'b111; y = 3'b001;
#1 x = 3'b010; y = 3'b001;
#1 x = 3'b010; y = 3'b011;
#1 x = 3'b110; y = 3'b001;
#1 x = 3'b101; y = 3'b010;
end
endmodule // test_fullAdder