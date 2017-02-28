/* Guia 01
   Nome:  Guilherme Lucindo dos Santos
   Matricula:	380766 */
	
	Porta XNor
	
	module portanand (s, a, b, c, d);
	output s;
	input a, b, c, d;
	
	assing s = ~ (a ^ b ^ c ^ d);
	
	endmodule
	
	
	
	TESTE DA PORTA
	
	module testeportanor;
	
	reg a,b,c,d;
	
	wire s;
	
	portanand XNOR1 (s,a,b,c);
	
	inicial begin
		$displey ("Guia 1 - Guilherme Lucindo - 380766");
		$displey ("Teste da porta XNor")
		$displey ("\n s = ~(a ^ b ^ c ^ b) \n");
		 a=0; b=0; c=0;
	 
	#1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=0; b=0; c=0; d=1;
	#1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=0; b=0; c=0; d=0;
	#1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=0; b=0; c=1; d=1;
	#1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=0; b=0; c=1; d=0;
	#1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=0; b=1; c=0; d=1;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=0; b=1; c=0; d=0;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=0; b=1; c=1; d=1;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=0; b=1; c=1; d=0;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=1; b=0; c=0; d=1;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=1; b=0; c=0; d=0;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=1; b=0; c=1; d=1;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=1; b=0; c=1; d=0;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=1; b=1; c=0; d=1;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=1; b=1; c=0; d=0;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=1; b=1; c=1; d=1;
   #1	$displey ("%b = ~(%b ^ %b ^ %b ^ %b)", s, a, b, c, d );
	   a=1; b=1; c=1; d=0;
end 

endmodule