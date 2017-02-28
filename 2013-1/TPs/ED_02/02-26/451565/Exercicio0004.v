
// ------------------------- 
// Exercicio 0004 
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
	reg signed [6:0] b; 
	reg signed [5:0] c;
	reg signed [4:0] d; 
	reg signed [7:0] e;
	// ------------------------- parte principal 
	initial begin 
		$display("Exercicio0004 - Guilherme Gideoni Albinati Batista - 451565"); 
		$display("complemento de 2 com registros limitados");
		
	 
	a= ~'b101111 + 'b1;
	$display(" a = %d = %8b", a, a);
	
	
	b= ~57 + 'b1;
	$display(" b = %d = %8b", b, b);
	
	
	c= ~25 + 'b1;
	$display(" c = %d = %8b", c, c);	  
	
	
	d= ~'hD + 'b1;
	$display(" d = %d = %8b", d, d);
	
	e= ~'o24 + 'b1;
	$display(" e = %d = %8b", e, e);
	
	end 
endmodule

/*
Exercicio0004 - Guilherme Gideoni Albinati Batista - 451565
complemento de 2 com registros limitados
 a =  -47 = 11010001
 b = -57 =  1000111
 c = -25 =   100111
 d = -13 =    10011
 e =  -20 = 11101100
*/