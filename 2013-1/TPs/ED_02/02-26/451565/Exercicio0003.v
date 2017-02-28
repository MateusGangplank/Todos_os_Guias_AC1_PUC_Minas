// ------------------------- 
// Exercicio 0003 
// Nome: Guilherme Gideoni Albinati Batista 
// Matricula: 451565
// ------------------------- 
// ------------------------- 

// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
	reg signed [7:0] a; 
	reg signed [5:0] b; 
	reg signed [5:0] c;
	reg signed [6:0] d; 
	reg signed [6:0] e;
	// ------------------------- parte principal 
	initial begin 
		$display("Exercicio0003 - Guilherme Gideoni Albinati Batista - 451565"); 
		$display("Complemento de 2 - Usando registradores com sinal para evidenciar a operacao");
		

	a='b101010;
	$display("a = %d = %8b", a, a); 
	a= ~a+'b1;
	$display("Complemento: a = %d = %8b", a, a);
	
	b= 'o25;
	$display("b = %d = %8b", b, b);
	b= ~b+'b1;
	$display("Complemento: b = %d = %8b", b, b);
	
	c= 27;
	$display("c = %d = %8b", c, c);
	c= ~c+'b1;
	$display("Complemento: c = %d = %8b", c, c);	  
	
	d= 'h2C;
	$display("d = %d = %8b", d, d);
	d= ~d+'b1;
	$display("Complemento: d = %d = %8b", d, d);
	
	e= 25-35;
	$display("e = %d = %8b", e, e);
	e= ~e+'b1;
	$display("Complemento: e = %d = %8b", e, e);
	
	end 
endmodule
/*
Exercicio0003 - Guilherme Gideoni Albinati Batista - 451565
Complemento de 2 - Usando registradores com sinal para evidenciar a operacao
a =   42 = 00101010
Complemento: a =  -42 = 11010110
b =  21 =   010101
Complemento: b = -21 =   101011
c =  27 =   011011
Complemento: c = -27 =   100101
d =  44 =  0101100
Complemento: d = -44 =  1010100
e = -10 =  1110110
Complemento: e =  10 =  0001010
*/