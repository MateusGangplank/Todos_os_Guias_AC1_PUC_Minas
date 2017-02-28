// ------------------------- 
// Exemplo0035 - F4
// Nome: Roger Rubens Machado 
// Matricula: 430533
// ------------------------- 

// f4_gate 
	
	module f4 (output s, input a, input b, input [2:0] c);
		wire s_and1;
		wire s_and2;
		wire s_and3;
		wire s_and4;
		wire s_and5;
		wire s_and6;
		wire s_and7;
		wire s_and8;
		wire s_xnor1;
		wire s_xor1;
		wire s_nor1;
		wire s_or1;
		wire s_nand1;
		
		not NOT1(s_not1, a);
		and AND2(s_and2, s_not1, ~c[0], ~c[1], ~c[2]);	
		or OR1(s_or1, a, b);
		and AND3(s_and3, s_or1, c[0], ~c[1], ~c[2]);		
		nor NOR1(s_nor1, a, b);
		and AND4(s_and4, s_nor1, ~c[0], c[1], ~c[2]);	
		and AND1(s_and1, a, b);
		and AND5(s_and5, s_and1, c[0], c[1], ~c[2]);	
		nand NAND1(s_nand1, a, b);
		and AND6(s_and6, s_nand1, ~c[0], ~c[1], c[2]);
		xor XOR1(s_xor1, a, b);
		and AND7(s_and7, s_xor1, c[0], ~c[1], c[2]);	
	 	xnor XNOR1(s_xnor1, a, b);
		and AND8(s_and8, s_xnor1, ~c[0], c[1], c[2]);
		
		or OR2(s, s_and2, s_and3, s_and4, s_and5, s_and6, s_and7, s_and8);
	
	endmodule // f4
	
	module test_f4;
		// --Definir dados
	 	reg x; 
	 	reg y; 
		reg [2:0] c;
		wire s; 
	 
	f4 modulo (s, x, y, c);
	
	// --Parte principal 
	initial begin 
		$display("Exemplo0035 - Roger Rubens Machado - 430533"); 
		$display("Test LU's module"); 
			
	   #1 x = 0; y = 0; c = 000;
		$monitor("Resultado Chave = %3b\n x = %1b \t y = %1b \t Resultado -> %1b\n", c, x, y, s);
	
	end
	endmodule // test_f4