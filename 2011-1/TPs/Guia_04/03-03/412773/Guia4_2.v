//----------------------------
// Nome: Silvino Henrique Santos de Souza
// Matrícula: 412773
//----------------------------


//----------------------------
//------ Guia 04 - 02---------
//----------------------------



module meiaSomacompacto(s0,s1,a,b);

	output s0,s1;
	input  a, b;
	
	and(s0, a, b);  
	xor(s1,  a, b);
	
	
endmodule // fim meiaSomacompacto

module SomaCompleta (Resultado, Cout, a, b, Cin);

	output Resultado, Cout;
	input  a, b, Cin;
	
	wire temp1, temp2, temp3;
	
	meiaSomacompacto SOMA1(temp1,temp2,a,b);
	meiaSomacompacto SOMA2(temp3,Resultado,temp2,Cin);
	
	or(Cout, temp1, temp3);
		

endmodule // fim SomaCompleta


module testeSomaCompleta;
	
	wire Resultado, Cout;
	reg  a, b, Cin;

	
	SomaCompleta SOMA (Resultado, Cout, a, b, Cin);
	
	initial begin
	
		$display("\n Guia 04 - 02 - Silvino Henrique Santos de Souza - 412773 ");
		$display("\n SOMADOR COMPLETO");
		$display("\n A + B = s0 s1 \n");

		a = 0; b = 0;  Cin = 0;
		$monitor(" %b + %b  = %b %b", a, b, Cout, Resultado);
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
	
		
	end
	 
endmodule // fim testeSomaCompleta

	
