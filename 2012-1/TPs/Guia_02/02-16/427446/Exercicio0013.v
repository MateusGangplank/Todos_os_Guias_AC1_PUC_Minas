//-------------------------------------
//Exercicio0013 - Complemento de 2
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//-------------------------------------

//----------------------------
//----------------complement
//---------------------------

module complement;
//---------------------definir dados
	reg[5:0]a;
	reg[4:0]b;
	reg[4:0]c;
	reg[5:0]d;
	reg[5:0]e;
	reg[4:0]e1;
	reg[5:0]e2;
	reg[5:0]aux;

	initial begin
		a = 6'b100111;
		b = 5'o23;
		c = 5'd23;
		d = 6'h2B;
		e1 = 5'd26;
		e2 = 6'd36;
		aux = ~e2 + 1'b1;
		e = e1 + aux;
		$display("Exercicio0013 -Test Complements - Mateus Guilherme do Carmo Cruz - 427446");
		$display("%6b[2] = %6b", a, (~a)+1'b1 );
		$display("%2o[8] = %5b = %5b", b,b, (~b) + 1'b1);
		$display("%2d[10] = %5b = %5b", c,c, (~c) + 1'b1);
		$display("%2h[16] = %6b = %6b", d,d, (~d) + 1'b1);
		$display("%2d[10] - %2d[10] = %5b - %6b = %5b + %6b = %6b = %-d",e1,e2,e1,e2,e1,aux,e,e);
	end
	
endmodule //complement