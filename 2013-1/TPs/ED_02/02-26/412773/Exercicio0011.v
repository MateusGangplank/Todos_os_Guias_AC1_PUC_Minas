//-------------------------------------
//Exercicio0011 - Operações
//Nome: Silvino Henrique Santos de Souza
//Matrícula: 412773
//-------------------------------------

module test_op;
//----------------definir dados
reg[4:0]a;
reg[4:0]b;
reg[3:0]c;
reg[3:0]d;
reg[3:0]e;

reg aux1,aux2,aux3,aux4;

//---------------- parte principal
	initial begin
		aux1 = 3; aux2 = 14;
		a = aux1 + aux2;
		aux1 = 3; aux2 = 8;
		b = aux1 * aux2;
		aux1 = 33; aux2 = 5;
		c = aux1 / aux2;
		aux1 = 25; aux2 = 11;
		d = aux1 - aux2;
		aux1 = 2; aux2 = 8; aux3 = 7; aux4 = 1;
		e = aux1 * aux2 + aux3 - aux4;
		
		$display("Exercicio0011 - Silvino Henrique Santos de Souza - 412773");
		$display("Operações fundamentais");
		$display("a = 3 + 14 = %5b",a);
		$display("b = 3 * 8 = %5b",b);
		$display("c = 33 / 5 = %4b",c);
		$display("d = 25 - 11 = %4b",d);
		$display("e = 2 * 8 + 7 - 1 = %4b",e);
	end
	
endmodule //test_op