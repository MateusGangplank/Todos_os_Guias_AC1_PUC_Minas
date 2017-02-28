// -------------------------
// Extra01 - complemento de 1
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
module complemento_de_1 ( output b,
input a);
assign b = 8'b11111111 - a;  // nota: a pode ser qualquer valor de 8 bits, que sera calculado seu complemento de 1
endmodule // xorgate
// test complemento de 1
// -------------------------
module test_base_11;
// ------------------------- definir dados
reg [7:0] a;
reg [7:0] b;
// ------------------------- parte principal
initial begin
$display("Extra01 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Complemento de 1: ");
a = 8'b10101010;
b = 8'b11111111 - a;

$display("o complemento de 1 de a = %8b", b);

end
endmodule // test_base