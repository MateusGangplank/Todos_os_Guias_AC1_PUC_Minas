// -------------------------
// Exemplo0035 - Selecionável
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------
// -------------------------
// selecionavel_gate
// -------------------------

	module selecionavel (output [3:0]saida_and, output [3:0]saida_nand, output [3:0]saida_or, output [3:0]saida_nor, output [3:0]saida_xor, output [3:0]saida_xnor,
								output [7:0]saida_not, input [3:0]entrada1, input [3:0]entrada2);
	//---AND				
		and AND1 (saida_and[0], entrada1[0], entrada2[0]);
		and AND2 (saida_and[1], entrada1[1], entrada2[1]);
		and AND3 (saida_and[2], entrada1[2], entrada2[2]);
		and AND4 (saida_and[3], entrada1[3], entrada2[3]);  
	//---NAND
		nand NAND1 (saida_nand[0], entrada1[0], entrada2[0]);
		nand NAND2 (saida_nand[1], entrada1[1], entrada2[1]);
		nand NAND3 (saida_nand[2], entrada1[2], entrada2[2]);
		nand NAND4 (saida_nand[3], entrada1[3], entrada2[3]);
	//---OR
		or OR1 (saida_or[0], entrada1[0], entrada2[0]);
		or OR2 (saida_or[1], entrada1[1], entrada2[1]);
		or OR3 (saida_or[2], entrada1[2], entrada2[2]);
		or OR4 (saida_or[3], entrada1[3], entrada2[3]);
	//---NOR			
		nor NOR1 (saida_nor[0], entrada1[0], entrada2[0]);
		nor NOR2 (saida_nor[1], entrada1[1], entrada2[1]);
		nor NOR3 (saida_nor[2], entrada1[2], entrada2[2]);
		nor NOR4 (saida_nor[3], entrada1[3], entrada2[3]);
	//---XOR			
		xor XOR1 (saida_xor[0], entrada1[0], entrada2[0]);
		xor XOR2 (saida_xor[1], entrada1[1], entrada2[1]);
		xor XOR3 (saida_xor[2], entrada1[2], entrada2[2]);
		xor XOR4 (saida_xor[3], entrada1[3], entrada2[3]);
	//---XNOR	
		xnor XNOR1 (saida_xnor[0], entrada1[0], entrada2[0]);
		xnor XNOR2 (saida_xnor[1], entrada1[1], entrada2[1]);
		xnor XNOR3 (saida_xnor[2], entrada1[2], entrada2[2]);
		xnor XNOR4 (saida_xnor[3], entrada1[3], entrada2[3]);
	//---NOT			
		not NOT1 (saida_not[0], entrada1[0]);
		not NOT2 (saida_not[1], entrada1[1]);
		not NOT3 (saida_not[2], entrada1[2]);
		not NOT4 (saida_not[3], entrada1[3]);
	//---NOT			
		not NOT5 (saida_not[4], entrada2[0]);
		not NOT6 (saida_not[5], entrada2[1]);
		not NOT7 (saida_not[6], entrada2[2]);
		not NOT8 (saida_not[7], entrada2[3]);

	endmodule //selecionavel

// ------------------------- 
// -- test selecionavel
// -------------------------
	module test_selecionavel; 
// ------------------------- definir dados 
		reg  [3:0] x;
		reg  [3:0] y;
			 
		wire [3:0] w;
		wire [3:0] r;
		wire [3:0] t;
		wire [3:0] p;
		wire [3:0] a;
		wire [3:0] f;
		wire [7:0] b;
		
		selecionavel modulo ( w, r, t, p, a, f, b, x, y);
	 
// ------------------------- parte principal 
	 initial begin
		$display("Exemplo0035 - João Henrique Mendes de Oliveira - 392734");
      $display("Test LU's module:\n");
		#1 x = 4'b0101; y = 4'b1010; 
		$monitor("Resultado: x = %4b \t y = %4b \n  Negação de x = %4b \t Negação de y = %4b\n  and = %4b \t nand = %4b \n   or = %4b \t  nor = %4b\n  xor = %4b \t xnor = %4b \n" , x, y, b[3:0], b[7:4], w, r, t, p, a, f );
		#1 x = 4'b0101; y = 4'b1010; 
		#1 x = 4'b1111; y = 4'b0000;
		#1 x = 4'b1001; y = 4'b1000; 
	 end
	endmodule // test_selecionavel