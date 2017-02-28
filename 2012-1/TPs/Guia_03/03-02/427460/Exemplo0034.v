// ------------------------- 
// Exemplo0034 - F4 
// Nome: Rodr1go Arruda de Assis  
// Matricula:427460  
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [1:0] s, 
	input [1:0] a, 
	input [1:0] b, 
	input	[1:0] chave); 

// descrever por portas
	wire [1:0]s1_or;
	wire [1:0]s2_or;
	wire [1:0]s3_nor;
	wire [1:0]s4_xor;
	wire [1:0]s5_xnor;	
	wire [1:0]s_not;
	wire [1:0]s_not2;
	wire [1:0]s_and2;
	wire [1:0]s_and3;
	wire [1:0]s_and4;
	wire [1:0]s_and5;
	
	

	or OR1(s2_or[0], a[0],b[0]);
	or OR1(s2_or[1], a[1],b[1]);

		
	nor NOR1(s3_nor[0], a[0], b[0]);
	nor NOR1(s3_nor[1], a[1], b[1]);
	
	xor XOR1(s4_xor[0], a[0], b[0]);
	xor XOR1(s4_xor[1], a[1], b[1]);
	
	xnor XNOR1(s5_xnor[0], a[0], b[0]);
	xnor XNOR1(s5_xnor[1], a[1], b[1]);

	not NOT1(s_not[0],chave[0]);
	not NOT1(s_not[1],chave[1]);
	
	not NOT2(s_not2[0],chave[0]);
	not NOT2(s_not2[1],chave[1]);
		
	and AND2(s_and2[0], s1_or[0], s_not[0], s_not2[0]);
	and AND2(s_and2[1], s1_or[1], s_not[1], s_not2[1]);

	and AND3(s_and3[0], s3_nor[0], s_not[0], chave[0]);
	and AND3(s_and3[1], s3_nor[1], s_not[1], chave[1]);
	
	and AND4(s_and4[0], s4_xor[0], chave[0], s_not2[0]);
	and AND4(s_and4[1], s4_xor[1], chave[1], s_not2[1]);
	
	and AND5(s_and5[0], s5_xnor[0], chave[0], chave[0]); 
	and AND5(s_and5[1], s5_xnor[1], chave[1], chave[1] ); 
			
	or OR2(s[0], s_and2[0], s_and3[0], s_and4[0], s_and5[0]);
	or OR2(s[1], s_and2[1], s_and3[1], s_and4[1], s_and5[1]);
	 
	endmodule // f4 
	module test_f4; 

// ------------------------- definir dados 
	reg [1:0] x; 
	reg [1:0] y;
	reg [1:0] ch;
	wire [1:0] z; 
	f4 modulo (z, x, y, ch); 

// ------------------------- parte principal 
	initial begin 
	$display("Exemplo0034 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test LU's module");
	$display("Legenda da chave: 00-OR 01-NOR 10-XOR  11-XNOR  \n"); 
		
	#1 ch = 0; x = 0;   y = 0;

// projetar testes do modulo 
	 $monitor("Chave = %1b\t x = %2b \t y = %2b\t  saida = %2b\n",ch,x,y,z);
	 
	 #1 ch = 0; x = 1; y = 1;
	 #1 ch = 0; x = 0; y = 1;
	 #1 ch = 0; x = 1; y = 0;
	 #1 ch = 1; x = 0; y = 0;
	 #1 ch = 1; x = 1; y = 1;
	 #1 ch = 1; x = 0; y = 1;
	 #1 ch = 1; x = 1; y = 0;
	 
end 
endmodule // test_f4 