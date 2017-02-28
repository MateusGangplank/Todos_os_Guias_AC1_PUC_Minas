// -------------------------
// Exercicio 04 - Complemento de 2 com complimento de bits
// Nome: Yousef Otacilio
// Matricula: 441714
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display(" Exercicio 04 - Yousef - 441714");
$display("Test number system");

a = ~6'b101011 + 1;
	       
b = ~6'b111001 + 1'b1;

c = ~5'd27 + 1'b1;


d = ~4'hC + 1'b1;


e = ~5'o21 + 1'b1;



$display("\nSoma dos Valores");
$display("a = %d = %6b", a, a);
$display("b = %d = %6b", b, b);
$display("c =  %d = %5b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);



end
endmodule // test_base