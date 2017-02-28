//-------------------------------------
//Exercicio0014 - Operações
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
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
		aux1 = 2; aux2 = 15;
		a = aux1 + aux2;
		aux1 = 3; aux2 = 8;
		b = aux1 * aux2;
		aux1 = 32; aux2 = 3;
		c = aux1 / aux2;
		aux1 = 21; aux2 = 11;
		d = aux1 - aux2;
		aux1 = 2; aux2 = 5; aux3 = 6; aux4 = 1;
		e = aux1 * aux2 + aux3 - aux4;
		
		$display("Exercicio0011 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Operações fundamentais");
		$display("a = 2 + 15 = %5b",a);
		$display("b = 3 * 8 = %5b",b);
		$display("c = 32 / 3 = %4b",c);
		$display("d = 21 - 11 = %4b",d);
		$display("e = 2 * 5 + 6 - 1 = %4b",e);
	end
	
endmodule //test_op
