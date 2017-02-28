//----------------------------------------------
//Exercício0012 - Mateus Guilherme do Carmo Cruz
//Matrícula - 427446
//-----------------------------------------------

module test_op2;
	reg[5:0]a;
	reg[5:0]b;
	reg[3:0]c;
	reg[6:0]d;
	reg[9:0]e;
	
	initial begin
		$display("Exercício0012 - Operações com bases diferentes");
		$display("Mateus Guilherme do Carmo Cruz - 427446");
		$display("\n");
		a = 6'b100010 + 5'b11010;
		b = 5'b11010 + 'o23;
		c = 'o1234 / 'h2D;
		d = 'h1A9 - 9'b101101001;
		e = 'o25 * 'o41 + 'h6B;
		$display("a = %b",a);
		$display("b = %b",b);
		$display("c = %b",c);
		$display("d = %b",d);
		$display("e = %b",e);
		
	end
endmodule