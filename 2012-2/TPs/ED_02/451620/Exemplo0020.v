// -------------------------
// Exemplo0020 - operacoes
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// test operacoes
// -------------------------
module test_base_10;
// ------------------------- definir dados
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0020 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Operacoes: ");
a = 8'b101010 + ((8'b11111111 - 8'b1001) + 1'b1);
b = 8'b11011 + ((8'b11111111 - 8'o15) + 1'b1) ;
c = 8'o34 + ((8'b11111111 - 8'hC) + 1'b1);
d = 8'hDA + ((8'b11111111 - 8'b10111001) + 1'b1);
e = 8'd27 + ((8'b11111111 - 8'h1b) + 1'b1);
$display("a = 101010(2) - 1001(2) = %6b", a);
$display("b = 11011(2) - 15(8) = %5b", b);
$display("c = 34(8) - C(16) = %5b", c);
$display("d = DA(16) - 10111001(2) = %6b", d);
$display("e = 27 - 1B(16) = %5b", e);

end
endmodule // test_base