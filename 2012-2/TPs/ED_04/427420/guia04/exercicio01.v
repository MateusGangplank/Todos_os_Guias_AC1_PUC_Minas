// -------------------------
// Exercio0001 – FULL ADDER
// Nome: Jenifer Henrique
// Matricula: 427420
// -------------------------
// -------------------------
//  full adder 3 bits
// -------------------------
`include "util.v"

module fullAdder3 (output [3:0] s, input [2:0] a, input [2:0] b);
       wire x, y;
       halfAdder HA1 (s[0], x, a[0], b[0]);
       fullAdder FA1 (s[1], y, a[1], b[1], x);
       fullAdder FA2 (s[2], s[3], a[2], b[2], y);

endmodule

module test_fullAdder;
// ------------------------- definir dados
reg [2:0]x;
reg [2:0]y;
wire [3:0] s;

fullAdder3 FA3 (s, x, y);
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Jenifer Henrique - 427420");
$display("Test ALU’s full adder 3 bits");

x = 3'b000; y = 3'b000;
$display("A   | B   |  Resultado");
// projetar testes do somador complete
$monitor("%3b %3b = %4b", x, y,  s);
#1 x = 3'b001; y = 3'b001;
#1 x = 3'b010; y = 3'b001;
#1 x = 3'b010; y = 3'b010;
#1 x = 3'b010; y = 3'b001;
#1 x = 3'b101; y = 3'b010;
end
endmodule // test_fullAdder