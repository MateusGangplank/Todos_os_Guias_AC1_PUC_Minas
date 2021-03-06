// -------------------------
// Exemplo0035 - F4 
// Nome: Rodr1go Arruda de Assis  
// Matricula:427460  
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output  s, 
	input  a, 
	input  b, 
	input	[2:0] chave); 

// descrever por portas
	wire s_and;
	wire s_or;
	wire s_or2;
	wire s_nor;
	wire s_nand;	
	wire s_xor;
	wire s_xnor;
	wire s_not;
	wire s_and2;
	wire s_and3;
	wire s_and4;
	wire s_and5;
	wire s_and6;
	wire s_and7;
	wire s_and8;
	
	
	not NOT1(s_not, a);

	or OR1(s_or, a, b);
	
	and AND1(s_and, a, b);
			
	nor NOR1(s_nor, a, b);
	
	nand NAND1(s_nand, a, b);
		
	xor XOR1(s_xor, a, b);
		
	xnor XNOR1(s_xnor, a, b);
	
	
	and AND2(s_and2, s_not, ~chave[0], ~chave[1], ~chave[2]); 			
	and AND3(s_and3, s_and, ~chave[0], chave[1], chave[2]);
	and AND4(s_and4, s_or, ~chave[0], ~chave[1], chave[2]);
	and AND5(s_and5, s_nor, ~chave[0], chave[1], ~chave[2]);
	and AND6(s_and6, s_nand, chave[0], ~chave[1], ~chave[2]); 
	and AND7(s_and7, s_xor, chave[0], ~chave[1], chave[2]); 
	and AND8(s_and8, s_xnor, chave[0], chave[1], ~chave[2]); 
	
	
			
	or OR2(s, s_and2, s_and3, s_and4, s_and5, s_and6, s_and7, s_and8);
	
	 
	endmodule // f4 
	module test_f4; 

// ------------------------- definir dados 
	reg  x; 
	reg  y;
	reg [2:0] ch;
	wire  z; 
	f4 modulo (z, x, y, ch); 

// ------------------------- parte principal 
	initial begin 
	$display("Exemplo0035 - Rodrigo Arruda de Assis - 427460"); 
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

// OBS.: QUANDO USAR DESCRICOES POR PORTAS, USAR APENAS PORTAS. EVITAR OPERADORES (~).
