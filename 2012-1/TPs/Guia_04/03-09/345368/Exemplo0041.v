// ------------------------- 
// Exemplo00038 - FULL ADDER 
// Nome: Marcio Santana Correa 
// Matricula: 345368
// ------------------------- 

// ------------------------- 
// comparador_diferenca 
// ------------------------- 

	module c_dif (output s, 
	input [3:0]a, 
	input [3:0]b); 
	
	// descrever por portas
	wire s0;
	wire s1;
	wire s2;
	wire s3;
	
	xor XOR1 (s0, a[0], b[0]);
	xor XOR2 (s1, a[1], b[1]);
	xor XOR3 (s2, a[2], b[2]);
	xor XOR3 (s3, a[3], b[3]);
	
	and AND1(s, s0, s1, s2, s3);
	
	

// descrever por portas 
	endmodule // comparador 
	module test_c_dif; 

// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	wire saida;
	c_dif modulo (saida,x,y); 
// ------------------------- parte principal 
	initial begin 
	$display("Exemplo00041 - Marcio Santana Correa - 345368"); 
	$display("Test ALU's comparador da diferenca"); 

// projetar testes do comparador da diferenca
	
	#1 x = 1111; y = 0000; 
	$monitor("x = %3b \t y = %3b\t  saida = %1b\n",x,y,saida);
	#1 x = 0001; y = 0001;
	#1 x = 0000; y = 0001;
	#1 x = 1111; y = 1000;   

end 
endmodule // test_comparador