//----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//----------------------------


//----------------------------
//------ Guia 04 - 01---------
//----------------------------



module meiaSoma(s0,s1,a,b);

	output s0,s1;
	input  a, b;
	wire temp1, temp2, temp3, temp4;
	
	
	nand NAND1 (temp1, a ,b);       			// ~(a & b)
	nand NAND1 (temp2, temp1, a);   			// ~(temp1 & a) 
	nand NAND1 (temp3, temp1, b);   			// ~(temp1 & b)
	nand NAND1 (s1 , temp2, temp3);			//~(temp2 & temp3)
	nand NAND1 (temp4, a, b);					// ~(a & b)
	nand NAND1 (s0 , temp4, temp4);	      // ~(temp4 & temp4)
	
endmodule // fim meiaSoma

module testemeiaSoma;
	
	reg a, b;	
	wire s0,s1, temp1, temp2, temp3, temp4;
	
	meiaSoma TESTE (s0,s1,a,b);
	
	initial begin
	
		$display("\n Guia 04 - 01 - Caio Ragacci Pimentel - 405794 ");
		$display("\n MEIO SOMADOR");
		$display("\n A + B = s0 s1 \n");
		
	#1	a = 0; b = 0;
		$monitor(" %b + %b = %b %b", a, b, s0, s1);
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
	
		
	end
	
endmodule // fim testemParabeeiaSoma

	




	
