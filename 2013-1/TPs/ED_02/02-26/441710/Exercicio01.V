// -------------------------
// Exercicio 1 
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------


//-----------------------
//--a) 3 + 14
//--b.) 3 * 8
//--c.) 33 / 5
//--d.) 25 – 11
//--e.) 2 * 8 + 7 - 1
//------------------------

module ex_1;
//-----------------------definir dados
	reg[4:0]a;
	reg[4:0]b;
	reg[2:0]c;
	reg[3:0]d;
	reg[4:0]e;
	
//-----------------------parte principal
initial begin
	$display("Exercicio 1 - Thais Mairink - 441710");
	
	a = 3+14;
	b = 3*8;
	c = 33/5;
	d = 25-11;
	e = 2*8+7-1;
	
	
	$display("\nValores ");
	$display("a = %d = %5b", a, a);
	$display("b = %d = %5b", b, b);
	$display("b = %d = %3b", c, c);
	$display("b = %d = %4b", d, d);
	$display("b = %d = %5b", e, e);
	

end

endmodule