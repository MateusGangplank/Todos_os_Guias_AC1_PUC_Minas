// -------------------------
// Exercicio0004
// Nome: Flavio Andrade Amaral Motta
// Matricula: 392001
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [8:0] a;
reg [7:0] b;
reg [6:0] c;
reg [5:0] d;
reg [8:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio0004 - Flavio Andrade Amaral Motta - 392001");
$display("Testando opera��es");
a = (6'b111111 - 6'b101010) + 2'b01;
b = 5'b11111 - 5'b11011 + 2'b01;
c = 5'b11111 - 23 + 2'b01;
d = 4'b1111 - 4'he + 2'b01;
e = 5'b11111 - 26 + 2'b01;
$display("\nOpera�oes primeiro exercicio");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %5b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base