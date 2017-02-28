//-----
//Exercicio 05
//Nome: Andre Campolina
//Matricula: 381217
//-----

//-----
//Mostrar resultado de operacoes em varias bases
//-----

module operacoes_bases;

reg[7:0] a;
reg[7:0] b;
reg[7:0] c;
reg[7:0] d;
reg[7:0] e;

initial begin
	
	a = 6'b101010 + (~4'b1001 + 1);
	b = 5'b11011 + (~6'o15 + 1);
	c = 6'o34 + (~4'hC + 1);
	d = 8'hDA + (~8'b10111001 + 1);
	e = 27 + (~8'h1B + 1);
	
	$display("a = %d = %7b", a, a);
	$display("b = %d = %7b", b, b);
	$display("c = %d = %7b", c, c);
	$display("d = %d = %7b", d, d);
	$display("e = %d = %7b", e, e);
	
end

endmodule