// -------------------------
// Exemplo0018 - complemento de 2
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// test complemento de 2
// -------------------------
module test_base_08;
// ------------------------- definir dados
reg [5:0] a;
reg [4:0] b;
reg [4:0] c;
reg [5:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0018 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Complemento de 2: ");
a = (6'b111111 - 6'b100110) + 1'b1;
b = (5'b11111 - 6'o24) + 1'b1 ;
c = (5'b11111 - 25) + 1'b1;
d = (6'b111111 - 6'h2D) + 1'b1;
e = (5'b11111 - ( 27 - 37 )) + 1'b1;
$display("a = 100110(2), complemento de 2 = %6b", a);
$display("b = 24(8), complemento de 2 = %5b", b);
$display("c = 25, complemento de 2 = %5b", c);
$display("d = 2D(16), complemento de 2 = %6b", d);
$display("e = 27-37, complemento de 2 = %5b", e);

end
endmodule // test_base