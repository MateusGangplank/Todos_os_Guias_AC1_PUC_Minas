//----------------------------
// Nome: Silvino Henrique Santos de Souza
// Matrícula: 412773
//----------------------------


//----------------------------
//------ Guia 04 - 04---------
//-----------EXTRA------------



module meiaDiferencanor(s0,s1,a,b);

	output s0,s1;
	input  a, b;
	
	wire temp1 , temp2, temp3, temp4, temp5, temp6, temp7;
	
	nor(temp1, a,b);           //~(a | b)
	nor(temp2, temp1, a);		//~(temp1 | a)
	nor(temp3, temp1, b);		//~(temp1 | b)
	nor(temp4, temp2, temp3);	//~(temp2 | temp3)
	nor(s1, temp4, temp4);	   //~(temp4 | temp4)
	
	nor(temp5, a , a);			//~(a | a)
	nor(temp6, temp5, temp5);	//~(temp5 | temp5)
	nor(temp7,  b, b);			//~(b | b)
	nor(s0, temp6, temp7);		//~(temp6 | temp7)
	
	
	
endmodule // fim meiaDiferencanor



module testemeiaDiferencanor;
	
	wire s0, s1;
	reg  a, b;

	
	meiaDiferencanor DIFERENCA (s0, s1, a, b);
	
	initial begin
	
		$display("\n Guia 04 - 04 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n MEIA DIFERENÇA SOMENTE COM NORs");
		$display("\n A - B = s0 s1 \n");

		a = 0; b = 0;  
		$monitor(" %b - %b = %b %b", a, b, s0, s1);
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
	
		
	end
	 
endmodule // fim testeDiferencaCompleta

	
