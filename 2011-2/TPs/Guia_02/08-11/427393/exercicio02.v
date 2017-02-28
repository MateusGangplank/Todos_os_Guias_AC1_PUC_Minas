// --
// --Exemplo0011 - BASE
// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --

module test_exercicio_02;
// -- definir dados
	reg [6:0]a;
	reg [5:0]b;
	reg [3:0]c;
	reg [6:0]d;
	reg [9:0]e;
	
// -- parte principal
initial begin
	a = 6'b100010 + 5'b11010;
	b = 5'b11010 + 5'o23;
	c = 10'o1234 / 10'h2D;
	d = 10'h1A9 - 9'b101101001;
	e = 25 * 10'o41 - 10'h6B;
	
	$display("a = 100010 + 11010 = %b", a);
	$display("b = 11010(2) + 23(8) = %b", b);
	$display("c = 1234(8) / 2D(16) = %b", c);
	$display("d = 1A9(16) - 101101001(2) = %b", d);
	$display("e = 25(10) * 41(8) +6B(16) = %b", e);
	
	
end
endmodule // test_exercicio_02