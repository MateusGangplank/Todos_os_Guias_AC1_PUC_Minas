// ---------------------------
// Nome: Caio Ragacci Pimentel
// Matricula: 405794
// --------------------------


//---------------------------
// --- Guia 01 - XORgate ---
//---------------------------


module xorgate (c , a, b);

	output  c;
	input   a, b;
	
	assign c = ((~a & b | a & ~b));
	
	
endmodule  //xorgate


//---------------------------
// ----- Teste  XORgate-----
//---------------------------

module testexorgate;

	reg  a, b;
	wire c; 
	
	//instancia
	xorgate XOR1 (c, a ,b);


	//parte principal
	initial begin
	
		$display ("\n Guia 01 - Caio Ragacci Pimentel - 405794");
		$display (" TESTE - Porta XOR ");
		$display ("\n a & b & c = ~d \n");
	#1	a = 0; b = 0; 
	#1	$display ("%b ^ %b = %b", a ,b ,c);
	#1	a = 0; b = 1 ;
	#1	$display ("%b ^ %b = %b", a ,b ,c);
	#1	a = 1; b = 0; 
	#1	$display ("%b ^ %b = %b", a ,b ,c);
	#1	a = 1; b = 1; 
	#1	$display ("%b ^ %b = %b", a ,b ,c);
			
		
	end
	
endmodule  // testexorgate


//-------------------------------------------------------------------------------------------------------------