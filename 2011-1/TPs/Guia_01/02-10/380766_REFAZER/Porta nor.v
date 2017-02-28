/* Guia 01
   Nome:  Guilherme Lucindo dos Santos
   Matricula:	380766 */
	
	Porta Nor
	
	module portanor (s, a, b, c);
	output s;
	input a, b, c;
	
	assing s = ~ (a | b | c);
	
	endmodule
	
	
	
	TESTE DA PORTA
	
	module testeportanor;
	
	reg a,b,c;
	
	wire s;
	
	portanand NOR1 (s,a,b,c);
	
	inicial begin
		$displey ("Guia 1 - Guilherme Lucindo - 380766");
		$displey ("Teste da porta NOR")
		$displey ("\n s = ~(a | b | c) \n");
		 a=0; b=0; c=0;
	 
	#1	$displey ("%b = ~(%b | %b | %b)", s, a, b, c );
	   a=0; b=0; c=1;
	#1	$displey ("%b = ~(%b | %b | %b)", s, a, b, c );
	   a=0; b=1; c=0;
	#1	$displey ("%b = ~(%b | %b | %b)", s, a, b, c );
	   a=0; b=0; c=1;
	#1	$displey ("%b = ~(%b | %b | %b)", s, a, b, c );
	   a=1; b=0; c=0;
	#1	$displey ("%b = ~(%b | %b | %b)", s, a, b, c );
	   a=1; b=0; c=1;
	#1	$displey ("%b = ~(%b | %b | %b)", s, a, b, c );
	   a=1; b=1; c=0;
	#1	$displey ("%b = ~(%b | %b | %b)", s, a, b, c );
	   a=1; b=1; c=1;
	#1	$displey ("%b = ~(%b | %b | %b)", s, a, b, c );
	   a=0; b=1; c=1;
end 

endmodule