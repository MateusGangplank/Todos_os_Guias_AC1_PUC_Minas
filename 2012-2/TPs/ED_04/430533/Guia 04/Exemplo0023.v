// ------------------------- 
// Exemplo0023 - Comparador
// Nome: Roger Rubens Machado
// Matricula: 430533
// ------------------------- 

// comparador 

module comparador (output s, input [2:0]a, input [2:0]b); 
	
	// descrever por portas
	wire s0;
	wire s1;
	wire s2;
	
	xnor XNOR1 (s0, a[0], b[0]);
	xnor XNOR2 (s1, a[1], b[1]);
	xnor XNOR3 (s2, a[2], b[2]);
	
   and AND1(s, s0, s1, s2);

endmodule // comparador 

	module test_comparador; 

	reg [2:0] x; 
	reg [2:0] y; 
	wire comparado;
	comparador modulo (comparado, x, y); 

initial begin 
	$display("Exemplo0023 - Roger Rubens Machado - 430533"); 
	$display("Test ALU's comparador"); 
	
	$monitor("x = %3b \t y = %3b\t  saida = %1b\n", x, y, comparado);
	#1 x = 0000; y = 0000; 
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1111; y = 1000;   

end 
endmodule // test_comparador