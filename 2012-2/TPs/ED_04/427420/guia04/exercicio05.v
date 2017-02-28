// -------------------------
// Exercicio0003 – COMPLEMENTO DE 2
// Nome: Jenifer Henrique
// Matricula: 427420
// -------------------------
// -------------------------
//  complemento de 2 3 bits
// -------------------------
`include "util.v"

module comp2_3b (output [3:0] s, input [2:0] a);
       reg x = 1;
       wire y, z;
       halfAdder HA1 (s[0], y, ~a[0], x );
       halfAdder HA2 (s[1], z, ~a[1], y );
       halfAdder HA3 (s[2], s[3], ~a[2], z);
endmodule

module test_comp2_3b;
// ------------------------- definir dados
reg [2:0]x;
wire [3:0] s;

comp2_3b COMP1 (s, x);
// ------------------------- parte principal
initial begin
$display("Exercicio05 - Jenifer Henrique - 427420");
$display("Test ALU’s complemento de 2 para 3 bits");

x = 3'b000;
$display("A   |  Resultado");
// projetar testes do somador complete
$monitor("%3b = %3b", x, s);
#1 x = 3'b000;
#1 x = 3'b010;
#1 x = 3'b011;
#1 x = 3'b110;
#1 x = 3'b111;
end
endmodule // test_comparador