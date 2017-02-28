//-------------------------------------
//Exercicio0014 - Complemento de 2
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//-------------------------------------

//----------------------------
//----------------complement
//---------------------------

module complement;
//-----------------definir dados
	reg[7:0]a;
	reg[6:0]b;
	reg[5:0]c;
	reg[4:0]d;
	reg[7:0]e;
	
	initial begin
		a = 8'b00101010;
		b = 7'b0011011;
		c = 6'd23;
		d = 5'hE;
		e = 8'o26;
		
		$display("Exercicio0014 - complemento de 2 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("%8b[2] = %8b", a, (~a) + 1'b1);
		$display("%7b[2] = %7b", b, (~b) + 1'b1);
		$display("%2d[10] = %6b = %6b", c,c, (~c) + 1'b1);
		$display("%h[16] = %5b = %5b", d,d, (~d) + 1'b1);
		$display("%2o[8] = %8b = %8b",e,e, (~e) + 1'b1);
	end
endmodule //complement