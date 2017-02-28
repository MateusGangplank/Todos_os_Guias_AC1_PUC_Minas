// ---------------------------
// Nome: Caio Ragacci Pimentel
// Matricula: 405794
// --------------------------


//---------------------------
// --- Guia 01 - NORgate ----
//---------------------------


module norgate (d, a, b, c);

	output d;
	input  a, b ,c;
	
	assign d = (~(a | b | c));
	
endmodule // norgate


//---------------------------
// ---- Teste - NORgate -----
//---------------------------

module testenorgate;

	reg  a, b, c;
	wire d;
	
	//instancia
	norgate NOR1 (d, a ,b ,c);
	
	//parte principal
	
	initial begin
	
		$display ("\n Guia 01 - Caio Ragacci Pimentel - 405794");
		$display (" TESTE - Porta NOR ");
		$display ("\n a | b | c = ~d \n");
	#1	a = 0; b = 0; c = 0;
	#1	$display ("%b | %b | %b = %b", a ,b ,c ,d);
	#1	a = 0; b = 0; c = 1;
	#1 $display ("%b | %b | %b = %b", a ,b ,c ,d);
	#1	a = 0; b = 1; c = 1;
	#1	$display ("%b | %b | %b = %b", a ,b ,c ,d);
	#1	a = 0; b = 1; c = 0;
	#1	$display ("%b | %b | %b = %b", a ,b ,c ,d);
	#1	a = 1; b = 0; c = 0;
	#1	$display ("%b | %b | %b = %b", a ,b ,c ,d);
	#1	a = 1; b = 1; c = 0;
	#1	$display ("%b | %b | %b = %b", a ,b ,c ,d);
	#1	a = 1; b = 0; c = 1;
	#1	$display ("%b | %b | %b = %b", a ,b ,c ,d);
	#1	a = 1; b = 1; c = 1;
	#1	$display ("%b | %b | %b = %b", a ,b ,c ,d);	
		
	end
	
endmodule  // testenordgate


//-------------------------------------------------------------------------------------------------------------