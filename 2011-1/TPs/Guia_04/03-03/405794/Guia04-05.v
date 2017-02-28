
//----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//----------------------------


//----------------------------
//------ Guia 04 - 05---------
//-----------EXTRA------------



module meiaDiferencanand(s0,s1,a,b);

	output s0,s1;
	input  a, b;
	
	wire temp1 , temp2, temp3, temp4, temp5;
	
	nand(temp1, a,b);           //~(a & b)
	nand(temp2, temp1, a);		 //~(temp1 & a)
	nand(temp3, temp1, b);		 //~(temp1 & b)
	nand(s1, temp2, temp3);		 //~(temp2 & temp3)
	
	
	nand(temp4, a , a);			//~(a & a)
	nand(temp5, temp4, b);		//~(temp4 & b)
	nand(s0, temp5, temp5);		//~(temp5 & temp5)
	
	
	
	
endmodule // fim meiaDiferencanand

module diferencaCompleta(s0,s1, a,b, Cin);
	
	output Diferenca, Cout;
	input  a, b, Cin;
	
	wire temp1, temp2, temp3, temp4;
	
	meiaDiferencanand(temp1, temp2, a,b);
	meiaDiferencanand(temp3, Diferenca, temp2,Cin);
	
	or(Cout,temp1, temp3);
	
endmodule // fim diferencaCompleta


module testeDiferencaCompleta;
	
	wire s0, s1;
	reg  a, b, Cin;

	
	diferencaCompleta DIFERENCA (s0, s1, a, b, Cin);
	
	initial begin
	
		$display("\n Guia 04 - 05 - Caio Ragacci Pimentel - 405794 ");
		$display("\n DIFERENÇA COMPLETA");
		$display("\n A - B = s0 s1 \n");

		a = 0; b = 0;  Cin = 0;
		$monitor(" %b - %b = %b %b", a, b, s0, s1);
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
	
		
	end
	 
endmodule // fim testeDiferencaCompleta

	
