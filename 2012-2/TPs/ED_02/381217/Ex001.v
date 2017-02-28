//-----
//Exercicio 01
//Nome: Andre Campolina
//Matricula: 381217
//-----

//-----
//Mostrar resultado de operacoes
//-----

module operacoes;

reg[4:0]a;
reg[4:0]b;
reg[2:0]c;
reg[3:0]d;
reg[4:0]e;

initial begin

	a = 2+14;	
	b = 3*9;
	c = 32/5;
	d = 24-11;
	e = 2*6+7-1;
	
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("c = %d = %3b", c, c);
	$display("d = %d = %3b", d, d);
	$display("e = %d = %5b", e, e);
	
end

endmodule