// -------------------------
// Exercicio 3 
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//--------------------------
//--Complemento de 2
//-------------------------

module ex_3;
	
	reg[5:0]a;
	reg[4:0]b;
	reg[4:0]c;
	reg[5:0]d;
	reg[4:0]e;
	
	

//-----------------------parte principal
initial begin
	$display("Exercicio 3 - Thais Mairink - 441710");
	
	a = ~(6'b101010)+1;
	b = ~(5'o25)+1;
	c = ~(5'd27)+1;
	d = ~(6'h2C)+1;
	e = ~(25-35)+1;
	
	//---------e.) 25 - 35;
	
	$display("    dec = bin = oct = hex");
	$display("a = %d = %b = %o = %h",a,a,a,a);
	$display("b = %d = %b = %o = %h ",b,b,b,b);
	$display("c = %d = %b = %o = %h",c,c,c,c);
	$display("d = %d = %b = %o = %h",d,d,d,d);
	$display("e = %d = %b = %o = %h",e,e,e,e);
	

	
end

endmodule
