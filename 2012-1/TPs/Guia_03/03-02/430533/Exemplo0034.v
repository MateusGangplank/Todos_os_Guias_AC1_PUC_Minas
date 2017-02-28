// ------------------------- 
// Exemplo0034 - F4
// Nome: Roger Rubens Machado
// Matricula: 430533
// ------------------------- 

// f4_gate 
 
	module f4 (output [1:0] s, input [1:0] a, input [1:0] b, input [1:0] chave);

		wire s_and1[1:0];
		wire s_and2[1:0];
		wire s_and3[1:0];
		wire s_and4[1:0];
		wire s_not1[1:0];
		wire s_not2[1:0];
		wire s_xnor1[1:0];
		wire s_xor1[1:0];
		wire s_nor1[1:0];
		wire s_or1[1:0];
		wire s_or2[1:0];
	
		and AND10(s_and1[0], chave[0], chave[1], s_xnor1[0]);
		and AND11(s_and1[1], chave[0], chave[1], s_xnor1[1]);
	 	and AND20(s_and2[0], chave[0], s_not2[0], s_xor1[0]);
	 	and AND21(s_and2[1], chave[0], s_not2[1], s_xor1[1]);
	 	and AND30(s_and3[0], s_not1[0], chave[1] , s_nor1[0]);
	 	and AND31(s_and3[1], s_not1[1], chave[1] , s_nor1[1]);
	 	and AND40(s_and4[0], s_not1[0], s_not2[0], s_or1[0]);
	 	and AND41(s_and4[1], s_not1[1], s_not2[1], s_or1[1]);
	 
	 	or OR10(s_or1[0], a[0], b[0]);
	 	or OR11(s_or1[1], a[1], b[1]);
	 	or OR20(s[0], s_and2[0], s_and3[0], s_and4[0], s_and5[0]);
	 	or OR21(s[1], s_and2[1], s_and3[1], s_and4[1], s_and5[1]);
		 
	 	xnor XNOR10(s_xnor1[0], a[0], b[0]);
	 	xnor XNOR20(s_xnor1[1], a[1], b[1]);
		
	 	xor XOR10(s_xor1[0], a[0], b[0]);
	 	xor XOR20(s_xor1[1], a[1], b[1]);
		 
	 	nor NOR10(s_nor1[0], a[0], b[0]);
		nor NOR20(s_nor1[1], a[1], b[1]);
	 
	 	not NOT10(s_not1[0], chave[0]);
	 	not NOT11(s_not1[1], chave[0]);
	 	not NOT20(s_not2[0], chave2[1]);
	 	not NOT21(s_not2[1], chave[0]);
        
	endmodule // f4
	
	module test_f4;
		// --Definir dados
	 	reg[1:0] x; 
	 	reg[1:0] y; 
		reg[1:0] c;
		wire[1:0] s; 
	 
	f4 modulo (s, x, y, c);
	
	// --Parte principal 
	initial begin 
		$display("Exemplo0034 - Roger Rubens Machado - 430533"); 
		$display("Test LU's module"); 
			
	   #1 x = 2'b00; y = 2'b00; c = 00;
		$monitor("Resultado Chave = %2b\n x = %2b \t y = %2b \t Resultado -> %2b\n", c, x, y, s);
		#1 x = 2'b01; y = 2'b10; c = 01;			
		#1 x = 2'b11; y = 2'b00; c = 00;
		#1 x = 2'b11; y = 2'b00; c = 10;		
		#1 x = 2'b10; y = 2'b10; c = 01;
		#1 x = 2'b10; y = 2'b10; c = 10;			 
		#1 x = 2'b01; y = 2'b00; c = 00;
		#1 x = 2'b01; y = 2'b00; c = 11;
	end
	endmodule // test_f4