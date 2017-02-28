// -------------------------
// Exercicio 03 - Complemento de 2
// Nome: Yousef Otacilio
// Matricula: 441714
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [5:0] a;
reg [4:0] b;
reg [4:0] c;
reg [5:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display(" Exercicio 03 - Yousef - 441714");
$display("Test number system");

a = ~6'b100110 + 1'b1;
	       
b = ~5'o24 + 1'b1;

c = ~5'd25 + 1'b1;


d = ~6'h2D + 1'b1;


e = ~(10'd27 - 10'd37) + 1'b1;



$display("\nSoma dos Valores");
$display("a = %d = %6b", a, a);
$display("b = %d = %5b", b, b);
$display("c =  %d = %5b", c, c);
$display("d = %d = %6b", d, d);
$display("e = %d = %4b", e, e);



end
endmodule // test_base