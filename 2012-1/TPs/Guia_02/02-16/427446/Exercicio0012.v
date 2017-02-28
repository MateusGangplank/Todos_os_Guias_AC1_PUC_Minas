//-------------------------------------
//Exercicio0012 - Operações
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//-------------------------------------

//--------------------
//------- operações
//-------------------

module op_test;

//-----------definir dados
	reg[5:0]a1;
	reg[4:0]a2;
	reg[6:0]a;
	
	reg[4:0]b1;
	reg[4:0]b2;
	reg[5:0]b;
	
	reg[9:0]c1;
	reg[5:0]c2;
	reg[3:0]c;
	
	reg[8:0]d1;
	reg[8:0]d2;
	reg[6:0]d;
	
	reg[4:0]e1;
	reg[4:0]e2;
	reg[6:0]e3;
	reg[9:0]e;

//---------------parte principal
	initial begin
		a1 = 6'b101010;
		a2 = 5'b11010;
		a = a1 + a2;
		
		b1 = 5'b11010;
		b2 = 5'o25;
		b = b1 + b2;
		
		c1 = 10'o1234;
		c2 = 6'h2B;
		c = c1 / c2;
		
		d1 = 9'h1CA;
		d2 = 9'b101110001;
		d = d1 - d2;
		
		e1 = 5'd25;
		e2 = 5'o31;
		e3 = 7'h7A;
		e = e1*e2 + e3;
		
		$display("Exercicio0012 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("\nOperações em diferentes bases");
		$display("a = %6b[2] + %5b[2] = %7b[2]",a1,a2,a);
		$display("b = %5b[2] + %2o[8] = %6b[2]",b1,b2,b);
		$display("c = %4o[8] / %2h[16] = %4b[2]",c1,c2,c);
		$display("d = %3h[16] - %9b[2] = %7b[2]",d1,d2,d);
		$display("e = %2d[10] * %2o[8] + %2h[16] = %10b[2]",e1,e2,e3,e);
	end

endmodule //op_test