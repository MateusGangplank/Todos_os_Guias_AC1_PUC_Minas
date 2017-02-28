//----------------------------
// Nome: Caio Ragacci Pimentel
// Matrícula: 405794
//----------------------------


//----------------------------
//------ Guia 04 - 03---------
//----------------------------



module meiaDiferencacompacto(s0,s1,a,b);

	output s0,s1;
	input  a, b;
	
	and(s0, ~a, b);  
	xor(s1,  a, b);
	
	
endmodule // fim meiaDiferencacompacto

module DiferencaCompleta (Resultado, Cout, a, b, Cin);

	output Resultado, Cout;
	input  a, b, Cin;
	
	wire temp1, temp2, temp3;
	
	meiaDiferencacompacto SOMA1(temp1,temp2,a,b);
	meiaDiferencacompacto SOMA2(temp3,Resultado,temp2,Cin);
	
	or(Cout, temp1, temp3);
		

endmodule // fim DiferencaCompleta


module testeDiferencaCompleta;
	
	wire Resultado, Cout;
	reg  a, b, Cin;

	
	DiferencaCompleta SOMA (Resultado, Cout, a, b, Cin);
	
	initial begin
	
		$display("\n Guia 04 - 03 - Caio Ragacci Pimentel - 405794 ");
		$display("\n SUBTRATOR COMPLETO");
		$display("\n A - B = s0 s1 \n");

		a = 0; b = 0;  Cin = 0;
		$monitor(" %b - %b = %b %b", a, b, Cout, Resultado);
	#1	a = 0; b = 1;
	
	#1	a = 1; b = 0;
	
	#1	a = 1; b = 1;
	
		
	end
	 
endmodule // fim testeDiferencaCompleta

	
