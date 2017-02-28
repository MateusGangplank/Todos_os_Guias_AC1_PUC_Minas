//-------------------------------------
//Exercicio0013 - Complemento de 2
//Nome: Silvino Henrique Santos de Souza
//Matr�cula: 412773
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
		a = 6'b101010;
		b = 5'o25;
		c = 5'd27;
		d = 6'h2C;
		e1 = 5'd25;
		e2 = 6'd35;
		aux = ~e2 + 1'b1;
		e = e1 + aux;
		$display("Exercicio0013 - Test Complements - Silvino Henrique Santos de Souza - 412773");
		$display("%6b[2] = %6b", a, (~a)+1'b1 );
		$display("%2o[8] = %5b = %5b", b,b, (~b) + 1'b1);
		$display("%2d[10] = %5b = %5b", c,c, (~c) + 1'b1);
		$display("%2h[16] = %6b = %6b", d,d, (~d) + 1'b1);
		$display("%2d[10] - %2d[10] = %5b - %6b = %5b + %6b = %6b = %-d",e1,e2,e1,e2,e1,aux,e,e);
	end
	
endmodule //complement