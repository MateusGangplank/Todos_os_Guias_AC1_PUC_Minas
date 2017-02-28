// ------------------------- 
// Exemplo0032 - F4
// Nome: Roger Rubens Machado
// Matricula: 430533
// -------------------------	 
// f4_gate 
	
	module f4 (output [1:0] s, input [1:0] a, input [1:0] b, input chave); 
		// descrever por portas
		wire [1:0] saida_and;
		wire [1:0] saida_or;
		wire [3:0] saida;
		wire saida_not;
		
		and AND1(saida_and[0], a[0], b[0]);
	   and AND2(saida_and[1], a[1], b[1]);	
		or OR1(saida_or[0], a[0], b[0]);
	   or OR2(saida_or[1], a[1], b[1]);	
		and AND3(saida[0], saida_and[0], chave);
	   and AND4(saida[1], saida_and[1], chave);	
		not NOT1(saida_not, chave);	
		and AND5(saida[2], saida_or[0], saida_not);
	   and AND6(saida[3], saida_or[1], saida_not);	
		or OR5(s[0], saida[0], saida[2]);
	   or OR6(s[1], saida[1], saida[3]);
	
	endmodule // f4
	
	module test_f4; 
		// --Definir dados 
		reg [1:0] x; 
		reg [1:0] y;
		reg c;
		wire [1:0] s; 
 
	f4 modulo (s, x, y, c);
	
	// --Parte principal 
	initial begin 
		$display("Exemplo0032 - Roger Rubens Machado - 430533"); 
		$display("Test LU's module"); 
		$display("Legenda da chave: O-OR 1-AND \n");
		
       #1 x = 2'b01; y = 2'b10; c = 0;
		 $monitor("Resultado Chave = %1b\n x = %2b \t y = %2b \t Resultado -> %2b\n", c, x, y, s);
		 #1 x = 2'b01; y = 2'b10; c = 1;		
		 #1 x = 2'b11; y = 2'b00; c = 0;
		 #1 x = 2'b11; y = 2'b00; c = 1;		
		 #1 x = 2'b10; y = 2'b10; c = 0;
		 #1 x = 2'b10; y = 2'b10; c = 1;		 
		 #1 x = 2'b01; y = 2'b00; c = 0;
		 #1 x = 2'b01; y = 2'b00; c = 1;
	end 
	endmodule // test_f4