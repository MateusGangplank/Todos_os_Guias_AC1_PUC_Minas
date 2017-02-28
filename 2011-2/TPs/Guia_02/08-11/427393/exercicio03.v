// --
// --Exemplo0011 - BASE
// --Nome: Camila Guedes Silveira
// --Matrícula: 427393
// --

module test_exercicio_03;
// -- definir dados
	reg [5:0]a;
	reg [6:0]b;
	reg [4:0]c;
	reg [6:0]d;
	reg [3:0]e;

// -- parte prncipal
initial begin
	a = ~(6'b100111) + 1'b1;
	b = ~(10'o54) + 1'b1;
	c = ~(13) + 1'b1;
	d = ~(6'h1B) + 1'b1;
	e = ~(25 - 36) + 1'b1;
	
	$display("Complemento de 2");
	$display("a = 100111 = %b", a);
	$display("b = 54(8) = %b", b);
	$display("c = 13(10) = %b", c);
	$display("d = 1B(16) = %b", d);
	$display("e = 25(10) - 16(10) = %b", e);
end
endmodule // test_exercicio_03