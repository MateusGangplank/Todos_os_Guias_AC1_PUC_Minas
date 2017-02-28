// --
// --Exemplo0011 - BASE
// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --

module test_exercicio_01;
// -- definir dados
	reg [4:0]a;
	reg [4:0]b;
	reg [4:0]c;
	reg [4:0]d;
	reg [4:0]e;
	
// -- parte principal
initial begin
	a = (2 + 14);
	b = (3 * 7);
	c = (34 / 3);
	d = (19 - 11);
	e = (2 * 4 + 6 - 1);
	
	$display("a = %d = %b", a, a);
	$display("b = %d = %b", b, b);
	$display("c = %d = %b", c, c);
	$display("d = %d = %b", d, d);
	$display("e = %d = %b", e, e);
end
endmodule //test_exercicio_01
