// ------------------------- 
// Exemplo00041 - ComparadorDif
// Nome: Samuel Eus�bio da Silva - 435055
// ------------------------- 

// ------------------------- 
// comparador_diferenca 
// ------------------------- 

	module comp_dif (output s, 
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire s0;
	wire s1;
	wire s2;
	wire s3;
	
	xnor XNOR1 (s0, a[0], b[0]);
	xnor XNOR2 (s1, a[1], b[1]);
	xnor XNOR3 (s2, a[2], b[2]);
	xnor XNOR3 (s3, a[3], b[3]);
	
	nand NAND1(s, s0, s1, s2, s3);
	
	

// descrever por portas 
	endmodule // comparador 
	module test_comp_dif; 

// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	wire comparado;
	comp_dif modulo (comparado,x,y); 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00041 - Samuel Eus�bio da Silva - 435055"); 
	$display("Test ALU's comparador da diferenca"); 

// projetar testes do comparador da diferenca
	
	$monitor("x = %3b \t y = %3b\t  saida = %1b\n",x,y,comparado);
	#1 x = 0000; y = 0000; 
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1111; y = 1000;   

end 
endmodule // test_comparador