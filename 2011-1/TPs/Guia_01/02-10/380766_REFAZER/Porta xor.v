/* Guia 01
   Nome:  Guilherme Lucindo dos Santos
   Matricula:	380766 */
	
	Porta Xor
	
	module portaxor (s, a, b);
	output s;
	input a, b;
	
	assing s = a ^ b;
	
	endmodule
	
	
	
	TESTE DA PORTA
	
	module testeportaxor;
	
	reg a,b;
	
	wire s;
	
	portanand XOR1 (s,a);
	
	inicial begin
		$displey ("Guia 1 - Guilherme Lucindo - 380766");
		$displey ("Teste da porta Xor")
		$displey ("\n s = (a ^ b) \n");
		 a=0; b=0; c=0;
	 
	#1	$displey ("%b = (%b ^ %b)", s, a, b);
	   a=0; b=0;
	#1	$displey ("%b = (%b ^ %b)", s, a, b);
	   a=0; b=1;
	#1	$displey ("%b = (%b ^ %b)", s, a, b);
	   a=1; b=0;
	#1	$displey ("%b = (%b ^ %b)", s, a, b);
	   a=1; b=1;
	end 

endmodule