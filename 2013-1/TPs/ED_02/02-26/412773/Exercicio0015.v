//-------------------------------------
//Exercicio0015 - Complemento de 2
//Nome: Silvino Henrique Santos de Souza
//Matrícula: 412773
//-------------------------------------

//----------------------------
//----------------complement
//---------------------------

module complement;
//-----------------definir dados
	reg[7:0]a,b,c,d,e;
	reg[7:0]a0,a1,b0,b1,c0,c1,d0,d1,e0,e1;
	
//--------------parte principal
	initial begin
		a0 = 8'b00101011;
		a1 = 8'b00001001;
		a1 = ~a1 + 1'b1;
		a = a0 + a1;

		b0 = 8'b00010011;
		b1 = 8'o15;
		b1 = ~b1 + 1'b1;
		b = b0 + b1;

		c0 = 8'o35;
		c1 = 8'hc;
		c1 = ~c1 + 1'b1;
		c = c0 + c1;

		d0 = 8'hba;
		d1 = 8'b10111001;
		d1 = ~d1 + 1'b1;
		d = d0 + d1;
		
		e0 = 8'd37;
		e1 = 8'h1b;
		e1 = ~e1 + 1'b1;
		e = e0 + e1;

		$display("Exercicio0015 - Silvino Henrique Santos de Souza - 412773");
		$display("\nComplemento de 2 com 8 bits\n");

		$display("%6b[2] - 1001[2] = %8b + %8b = %8b",a0,a0,a1,a);
		$display("%5b[2] - 15[8] = %8b + %8b = %8b",b0,b0,b1,b);
		$display("%2o[8] - C[16] = %8b + %8b = %8b",c0,c0,c1,c);
		$display("%2h[16] - 10111001[2] = %8b + %8b = %8b",d0,d0,d1,d);
		$display("%2d[10] - 1B[16] = %8b + %8b = %8b",e0,e0,e1,e);
	end

endmodule //complement