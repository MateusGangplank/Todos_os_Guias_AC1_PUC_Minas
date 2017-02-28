// ------------------------- 
// Exemplo0033 - F4 
// Nome: Rodr1go Arruda de Assis  
// Matricula:427460  
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 
	module f4 (output [1:0] s,
	input [1:0]a, 
	input [1:0]b, 
	input [1:0]chave); 

// descrever por portas
	wire [1:0]s1_and;
	wire [1:0]s2_or;
	wire [1:0]s_not;
	wire [1:0]s3_nand;
	wire [1:0]s4_nor;
	wire [1:0]s_and2;
	wire [1:0]s_and3;
	wire [1:0]s_and4;
	wire [1:0]s_and5;	
	
	and AND1(s1_and [0], a[0], b[0]);
	and AND1(s1_and [1], a[1], b[1]);
		
	or OR1(s2_or[0], a[0], b[0]);
	or OR1(s2_or[1], a[1], b[1]);
		
	nor NOR1(s4_nor[0], a[0], b[0]);
	nor NOR1(s4_nor[1], a[1], b[1]);
	
	nand NAND1(s3_nand[0], a[0], b[0]);
	nand NAND1(s3_nand[1], a[1], b[1]);
	
	not NOT1(s_not[0], chave[0]);
	not NOT1(s_not[1], chave[1]);
		
	and AND2(s_and2[0], s1_and[0],s_not[0]);
	and AND2(s_and2[1], s1_and[1],s_not[1]);
	
	and AND3(s_and3[0], s2_or[0], s_not[0]);
	and AND3(s_and3[1], s2_or[1], s_not[1]);
	
	and AND4(s_and4[0], s3_nand[0],chave[0]);
	and AND4(s_and4[1], s3_nand[1],chave[1]);
	
	and AND5(s_and5[0], s4_nor[0], chave[0]); 
	and AND5(s_and5[1], s4_nor[1], chave[1]); 
			
	or OR2(s[0], s_and2[0], s_and3[0], s_and4[0], s_and5[0]);
	or OR3(s[1], s_and2[1], s_and3[1], s_and4[1], s_and5[1]);	
	
	 
	endmodule // f4 
	module test_f4; 

// ------------------------- definir dados 
	reg  [1:0]x; 
	reg  [1:0]y;
	reg  [1:0]ch;
	wire [1:0] z; 
	f4 modulo (z, x, y, ch); 

// ------------------------- parte principal 
	initial begin 
	$display("Exemplo0033 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test LU's module");
	$display("Legenda da chave: O-OR/AND  1-NOR/NAND \n"); 
		
		#1 ch = 0; x = 0;   y = 0;

// projetar testes do modulo 
	 $monitor("Chave = %1b\t x = %2b \t y = %2b\t  saida = %2b\n",ch,x,y,z);
	 #1 ch = 0; x = 1;   y = 1;
	 #1 ch = 0; x = 0; y = 1;
	 #1 ch = 0; x = 1; y = 0;
	 #1 ch = 1; x = 0; y = 0;
	 #1 ch = 1; x = 1; y = 1;
	 #1 ch = 1; x = 0; y = 1;
	 #1 ch = 1; x = 1; y = 0;
	
	 
	 
		 
end 
endmodule // test_f4 