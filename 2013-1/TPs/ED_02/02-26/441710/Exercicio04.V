// -------------------------
// Exercicio 4 
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//--------------------------
//--Complemento de 2
//-------------------------
module  ex_4;

	reg[8:0]a;
	reg[7:0]b;
	reg[6:0]c;
	reg[5:0]d;
	reg[8:0]e;
	
//-----------------------parte principal
initial begin
	$display("Exercicio 4 - Thais Mairink - 441710");
	
	a = ~(8'b101111)+1;
	b = ~(7'b111001)+1;			//321 na base 4 em binario 
	c = ~(6'd25)+1;
	d = ~(5'hD)+1;
	e = ~(8'o24)+1;
	
	$display("    dec =   bin    = oct = hex");
	$display("a = %d = %b = %o = %h",a,a,a,a);
	$display("b = %d = %b = %o = %h ",b,b,b,b);
	$display("c = %d = %b = %o = %h",c,c,c,c);
	$display("d = %d = %b = %o = %h",d,d,d,d);
	$display("d = %d = %b = %o = %h",e,e,e,e);

	
end

endmodule
