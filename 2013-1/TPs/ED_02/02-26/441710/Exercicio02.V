// -------------------------
// Exercicio 2 
// Nome: Thais Mairink
// Matricula: 441710
// -------------------------

//------------------------
//--a.) 100110(2) + 11011(2) 
//--b.) 11101(2) + 25(8) 
//--c.) 1234(8) / 4C(16) 
//--d.) 1BA(16) - 101110011(2) 
//--e.) 25 * 32(8) + 8A(16) 
//--------------------------

module ex_2;
//----------------------------------definir dados
	reg[6:0]a;
	reg[5:0]b;
	reg[3:0]c;
	reg[6:0]d;
	reg[9:0]e;



//-----------------------parte principal
initial begin
	$display("Exercicio 2 - Thais Mairink - 441710");

	a = 6'b100110 + 5'b11011;
	b = 5'b11101 + 5'o25;
	c = 10'o1234 / 7'h4C;
	d = 9'h1BA - 8'b10111001;
	e = 5'd25 * 5'o32 + 8'h8A;
	
	
	$display("\nValores ");
	$display("a = %d = %7b", a, a);
	$display("b = %d = %6b",b,b);
	$display("b = %d = %4b",c,c);
	$display("b = %d = %7b",d,d);
	$display("b = %d = %10b",e,e);
	
end

endmodule