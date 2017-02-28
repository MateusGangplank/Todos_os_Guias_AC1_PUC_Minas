// -------------------------
// Exemplo0034 - Selecionável
// Nome: Fernando dos Santos Silva
// Matricula: 414506// -------------------------
// -------------------------
// selecionavelecionavel_gate
// -------------------------

	module selecionavel (output [0:0]saida_or, output [0:0]saida_nor, output [0:0]saida_xor, output [0:0]saida_xnor, output [1:0]saida_not, output [1:0]s1, 
								output [1:0]s2, output [0:0]saida0, output [0:0]saida1,output [1:0]saidaF,output [0:0]saidaMain, input [0:0]entrada1, input [0:0]entrada2, input [1:0]chave);
		
		
		//---OR		 
		or XNOR1(saida_or[0], entrada1[0], entrada2[0]);
			//---OR	
		nor NOR1(saida_nor[0], entrada1[0], entrada2[0]);
 //---XOR				
		xor XOR1(saida_xor[0], entrada1[0], entrada2[0]);
			//---OR	
		xnor OR1(saida_xnor[0], entrada1[0], entrada2[0]);
				//---NOT		 
		not NOT1(saida_not[0], chave[0]); 
	//---AND		 
		and AND1(s1[0], saida_or[0], saida_not[0]);
			//---AND		
		and AND5(s1[1], saida_nor[0], chave[0]);
	
	//---AND			 
		and AND9(s2[0], saida_xor[0], saida_not[0]);
			//---AND		
		and AND13(s2[1], saida_xnor[0], chave[0]);
			//---OR		 
		or OR1(saida0[0], s1[0], s1[1]);
			//---OR		 
		or OR5(saida1[0], s2[0], s2[1]);
		not NOT2(saida_not[1],chave[1]);
		
		and AND15(saidaF[0],saida0[0],saida_not[1]);
		and AND16(saidaF[1],saida1[0],chave[1]);
		
	   or OR10(saidaMain[0],saidaF[0],saidaF[1]);
		
		
		
		
		endmodule //selecionavel

// ------------------------- 
// -- test selecionavel
// -------------------------
	 module test_selecionavel; 
// ------------------------- definir dados 
		reg  [0:0] x;
		reg  [0:0] y;
		reg  [1:0] c;
			 
		wire [0:0] w;
		wire [0:0] k;
		wire [0:0] t;
		wire [0:0] z;
		wire [1:0] a;
		wire [1:0] h;
		wire [1:0] p;
		wire [1:0] q;
		wire [0:0] r;
		wire [0:0] s0;
		wire [0:0] s1;
		
		selecionavel modulo (w, k, t, z, a, h, p, s0, s1,q,r ,x ,y , c);
	  
// ------------------------- parte principal 
	 initial begin
		$display("Exemplo0034 - Fernando dos Santos Silva - 414506");
      $display("Test LU's module:\n");
      #1 x = 1'b1; y = 1'b0; c = 2'b00;
		$monitor("%2b %1b %1b %2b", c, x, y,r);
		#1 x = 1'b1; y = 1'b0; c = 2'b01;
		
		#1 x = 1'b1; y = 1'b0; c = 2'b10;
		#1 x = 1'b1; y = 1'b0; c = 2'b11;
		
			 end
	endmodule // test_selecionavel