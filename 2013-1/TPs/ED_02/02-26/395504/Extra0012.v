//-------------------------------------
//Extra0012 - Complemento de 2 com 1 byte
//Nome: Thaise Souto Martins
//Matr�cula: 395504
//-------------------------------------

//--------------
//-- complement
//--------------

module complement(output[7:0]s, input[7:0]a);
	assign s = (~a) + 1'b1;
endmodule //complement

module test_complement;
	//--------------definir dados
	reg[7:0]a;
	wire[7:0]b;
	
	//instancia
	complement comp1(b,a);	


	//parte principal
	initial begin
		a = 8'b00000000;
		$display("Extra0012 - Thaise Souto Martins - 395504");
		$display("Complemento de 2 - 1 byte");
		$display("\n~a + 1 = b\n");
		$monitor("%8b = %8b",a,b);
		#1 a = 1;
		#1 a = 2;
		#1 a = 3;
		#1 a = 4;
		#1 a = 5;
		#1 a = 6;
		#1 a = 7;
		#1 a = 8;
		#1 a = 9;
		#1 a = 10;
		#1 a = 255;
	end
endmodule //test_complement