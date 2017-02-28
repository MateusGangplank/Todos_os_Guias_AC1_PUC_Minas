// ---------------------------
// Nome: Caio Ragacci Pimentel
// Matricula: 405794
// --------------------------

//---------------------------
// --- Guia 01 - NANDgate ---
//---------------------------


module nandgate (d , a, b, c);

	output  d;
	input   a, b, c;
	
	assign d = (~(a & b & c));
	
	
endmodule  //nandgate


//---------------------------
// ----- Teste  NANDgate-----
//---------------------------

module testenandgate;

	reg  a, b, c;
	wire d; 
	
	//instancia
	nandgate NAND1 (d, a ,b ,c);


	//parte principal
	initial begin
	
		$display ("\n Guia 01 - Caio Ragacci Pimentel - 405794");
		$display (" TESTE - Porta NAND ");
		$display ("\n a & b & c = ~d \n");
	#1	a = 0; b = 0; c = 0;
	#1	$display ("%b & %b & %b = %b", a ,b ,c ,d);
	#1	a = 0; b = 0; c = 1;
	#1	$display ("%b & %b & %b = %b", a ,b ,c ,d);
	#1	a = 0; b = 1; c = 1;
	#1	$display ("%b & %b & %b = %b", a ,b ,c ,d);
	#1	a = 0; b = 1; c = 0;
	#1	$display ("%b & %b & %b = %b", a ,b ,c ,d);
	#1	a = 1; b = 0; c = 0;
	#1	$display ("%b & %b & %b = %b", a ,b ,c ,d);
	#1	a = 1; b = 1; c = 0;
	#1	$display ("%b & %b & %b = %b", a ,b ,c ,d);
	#1	a = 1; b = 0; c = 1;
	#1	$display ("%b & %b & %b = %b", a ,b ,c ,d);
	#1	a = 1; b = 1; c = 1;
	#1	$display ("%b & %b & %b = %b", a ,b ,c ,d);	
		
	end
	
endmodule  // testenandgate


//-------------------------------------------------------------------------------------------------------------