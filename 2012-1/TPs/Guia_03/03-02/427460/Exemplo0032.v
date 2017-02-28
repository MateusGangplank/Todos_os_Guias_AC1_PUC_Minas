// ------------------------- 
// Exemplo0032 - F4 
// Nome: Rodr1go Arruda de Assis  
// Matricula:427460  
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 
	module f4 (output [1:0] s, 
	input [1:0] a, 
	input [1:0] b, 
	input chave); 

// descrever por portas
	wire [1:0]s1_and;
	wire [1:0]s2_or;
	wire [3:0]saida;
	wire s_not;
	
	and AND1(s1_and[0],a[0],b[0]);
	and AND2(s1_and[1],a[1],b[1]);
	
	or OR1(s2_or[0],a[0],b[0]);
	or OR2(s2_or[1],a[1],b[1]);
	
	and AND3(saida[0], s1_and[0],chave);
	and AND4(saida[1], s1_and[1],chave);
	
	and AND5(saida[2], s2_or[0],s_not);
	and AND6(saida[3], s2_or[1],s_not);
	 
	not NOT1(s_not,chave);
	
	or OR3(s[0], saida[0], saida[2]);
	or OR4(s[1], saida[1], saida[3]);
	 
	endmodule // f4 
	module test_f4; 

// ------------------------- definir dados 
	reg [1:0] x; 
	reg [1:0] y;
	reg  ch;
	wire [1:0] z; 
	f4 modulo (z, x, y, ch); 

// ------------------------- parte principal 
	initial begin 
	$display("Exemplo0032 - Rodrigo Arruda de Assis - 427460"); 
	$display("Test LU's module");
	$display("Legenda da chave: O-OR 1-AND \n"); 
		
		#1 x = 4'b10;   y = 4'b01; ch = 0; 

// projetar testes do modulo 
	 $monitor("Chave = %1b\t x = %2b \t y = %2b\t  saida = %2b\n",ch,x,y,z);
	 
	 #1 x = 2'b00; y = 2'b10; ch = 1;
	 #1 x = 2'b00; y = 2'b10; ch = 0;
	 	
	 #1 x = 2'b11; y = 2'b00; ch = 0;
	 #1 x = 2'b11; y = 2'b00; ch = 1;
	 
	 #1 x = 2'b00; y = 2'b00; ch = 0;
	 #1 x = 2'b00; y = 2'b00; ch = 1;
	 
	 #1 x = 2'b10; y = 2'b10; ch = 0;
	 #1 x = 2'b10; y = 2'b10; ch = 1;
	 
end 
endmodule // test_f4 