//----------------------------------------------
//Exercício0011 - Mateus Guilherme do Carmo Cruz
//Matrícula - 4727446
//-------------------------------------------------

module test_op;
	reg[4:0]a;
	reg[4:0]b;
	reg[3:0]c;
	reg[3:0]d;
	reg[3:0]e;
	
	initial begin
		a = 2+14;
		b = 3*7;
		c = 34/3;
		d = 19-11;
		e = 2*4 + 6 - 1;
		
		$display("Exercício0011 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("\nTeste number system\n");
		$display("a = %d = %5b",a,a);
		$display("b = %d = %5b",b,b);
		$display("c = %d = %4b",c,c);
		$display("d = %d = %4b",d,d);
		$display("e = %d = %4b",e,e);
	end

endmodule