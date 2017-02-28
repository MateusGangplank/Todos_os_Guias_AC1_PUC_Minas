// -------------------------
// Exemplo0019 - complemento de 2
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// test complemento de 2
// -------------------------
module test_base_09;
// ------------------------- definir dados
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0019 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Complemento de 2: ");
a = (8'b11111111 - 8'b101011) + 1'b1;
b = (7'b1111111 - 7'b111001) + 1'b1 ;
c = (6'b111111 - 6'd27) + 1'b1;
d = (5'b11111 - 5'hC) + 1'b1;
e = (8'b11111111 - 8'o21) + 1'b1;
$display("a = 101011(2), complemento de 2 = %6b", a);
$display("b = 321(4), complemento de 2 = %5b", b);
$display("c = 27(10), complemento de 2 = %5b", c);
$display("d = C, complemento de 2 = %6b", d);
$display("e = 21(8), complemento de 2 = %5b", e);

end
endmodule // test_base