
// ------------------------- 
// Exercicio 0005 
// Nome: Guilherme Gideoni Albinati Batista 
// Matricula: 451565
// ------------------------- 
// ------------------------- 

// -------------------------

module CP2 (output s, input p); 
	assign s = ~p + 'b1; // criar vinculo permanente 
 
endmodule // buffer
 
module test_base_01; 
// ------------------------- definir dados 
	reg signed [7:0] a; 
	reg signed [7:0] b; 
	reg signed [7:0] c;
	reg signed [7:0] d; 
	reg signed [7:0] e;
	// ------------------------- parte principal 
	initial begin 
		$display("Exercicio0005 - Guilherme Gideoni Albinati Batista - 451565"); 
		$display("Subtracao com complemento de 2");
		
	 
	a= 'b101011 + ~'b1001 + 'b1;
	$display(" a = %d = %8b", a, a);
	
	
	b= 'b10011 + ~'o15 + 'b1;
	$display(" b = %d = %8b", b, b);
	
	
	c= 'o35 + ~'hC + 'b1;
	$display(" c = %d = %8b", c, c);	  
	
	
	d= 'hBA + ~'b10111001 + 'b1;
	$display(" d = %d = %8b", d, d);
	
	e= 37 + ~'h1B + 'b1;
	$display(" e = %d = %8b", e, e);
	
	end 
endmodule

/*
Exercicio0005 - Guilherme Gideoni Albinati Batista - 451565
Subtracao com complemento de 2
 a =   34 = 00100010
 b =    6 = 00000110
 c =   17 = 00010001
 d =    1 = 00000001
 e =   10 = 00001010
*/