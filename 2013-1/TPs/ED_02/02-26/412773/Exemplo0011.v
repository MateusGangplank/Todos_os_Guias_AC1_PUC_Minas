//-------------------------------------
//Exemplo0011 - BASE
//Nome: Silvino Henrique Santos de Souza
//Matr�cula: 412773
//-------------------------------------

//---------------------
//test number system
//---------------------

module test_base_01;
//------------------ definir dados
	reg[2:0]a;
	reg[3:0]b;
	reg[4:0]c;
	reg[4:0]d;

//------------------ parte principal
	initial begin
		$display("Exemplo0011 - Silvino Henrique Santos de Souza - 412773");
		$display("Test number system");
		
		a=5;
		b=10;
		c=15;
		d=20;
		
		$display("\nPositive value");
		$display("a = %d = %3b",a,a);
		$display("b = %d = %4b",b,b);
		$display("c = %d = %5b",c,c);
		
		$display("b = %d = %4b",b,b);
		$display("c = %d = %5b",c,c);
		$display("d = %d = %5b",d,d);
		$display("c = %d = %5o",d,d);
		$display("c = %d = %5h",d,d);
	end

endmodule //test_base