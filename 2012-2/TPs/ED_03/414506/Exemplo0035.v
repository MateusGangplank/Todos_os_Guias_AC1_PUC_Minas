// -------------------------
// Exemplo0035 - Selecionável
// Nome: Fernando dos Santos Silva
// Matricula: 414506
// -------------------------
// -------------------------
// selecionavel_gate
// -------------------------

	module selecionavel (output [0:0]saida_not, output [0:0]saida_notB, output [0:0]saida_and, output [0:0]saida_or, output [0:0]saida_nand, output [0:0]saida_nor,
								output [0:0]saida_xor,output [0:0]saida_xnor, input [0:0]entrada1, input [0:0]entrada2,input [0:2]chave,output [0:0]saidaFinal);
	
		output [2:0]chave_not;
		output [7:0]andS;
		output [3:0]andS2;
		output [1:0]andS3; 
		output [3:0]ORS;
		output [1:0]ORS2;
		//---NOT			
		not NOT1 (saida_not[0], entrada1[0]);
		//---NOT			
		not NOT2 (saida_notB[0], entrada2[0]);
      //---AND				
		and AND1 (saida_and[0], entrada1[0], entrada2[0]);
		//---OR
		or OR1 (saida_or[0], entrada1[0], entrada2[0]);
      //---NAND
		nand NAND1 (saida_nand[0], entrada1[0], entrada2[0]);
	   //---NOR			
		nor NOR1 (saida_nor[0], entrada1[0], entrada2[0]);
		//---XOR			
		xor XOR1 (saida_xor[0], entrada1[0], entrada2[0]);
		//---XNOR	
		xnor XNOR1 (saida_xnor[0], entrada1[0], entrada2[0]);
		
		//-- selecionadorA
		not NOT3(chave_not[0],chave[0]);
		and AND2(andS[0],saida_not[0],chave_not[0]);
		and AND3(andS[1],saida_notB[0],chave[0]);
		and AND4(andS[2],saida_and[0],chave_not[0]);
		and AND5(andS[3],saida_or[0],chave[0]);
		and AND6(andS[4],saida_nand[0],chave_not[0]);
		and AND7(andS[5],saida_nor[0],chave[0]);
		and AND8(andS[6],saida_xor[0],chave_not[0]);
		and AND9(andS[7],saida_xnor[0],chave[0]);
		or OR2(ORS[0],andS[0],andS[1]);
		or OR3(ORS[1],andS[2],andS[3]);
		or OR4(ORS[2],andS[4],andS[5]);
		or OR5(ORS[3],andS[6],andS[7]);
		//--SelecionadorB
		not NOT4(chave_not[1],chave[1]);
		and AND9(andS2[0],ORS[0],chave_not[1]);
		and AND10(andS2[1],ORS[1],chave[1]);
		and AND11(andS2[2],ORS[2],chave_not[1]);
		and AND12(andS2[3],ORS[3],chave[1]);
		or OR6(ORS2[0],andS2[0],andS2[1]);
		or OR7(ORS2[1],andS2[2],andS2[3]);
		//--SelecionadorC
		not NOT5(chave_not[2],chave[2]);
		and AND13(andS3[0],ORS2[0],chave_not[2]);
		and AND14(andS3[1],ORS2[1],chave[2]);
		or OR8(saidaFinal[0],andS3[0],andS3[1]);
				
	endmodule //selecionavel

// ------------------------- 
// -- test selecionavel
// -------------------------
	module test_selecionavel; 
// ------------------------- definir dados 
		reg  [0:0] x;
		reg  [0:0] y;
		reg  [2:0] chav;
			 
		wire [0:0] w;
		wire [0:0] z;
		wire [0:0] r;
		wire [0:0] t;
		wire [0:0] p;
		wire [0:0] a;
		wire [0:0] f;
		wire [0:0] b;
		wire [0:0]said;
		
		selecionavel modulo ( w,z, r, t, p, a, f, b, x, y,chav,said);
	 
// ------------------------- parte principal 
	 initial begin
		$display("Exemplo0035 - Fernando dos Santos Silva - 414506");
      $display("Test LU's module:\n");
		#1 x = 1'b0; y = 1'b0; chav = 3'b000; 
		$monitor("Resultado: %1b %1b %3b %1b",x,y , chav,said[0]);
		#1 x = 1'b0; y = 1'b1; chav = 3'b001; 
		#1 x = 1'b1; y = 1'b0; chav = 3'b010;
		#1 x = 1'b1; y = 1'b1; chav = 3'b011;
		#1 x = 1'b0; y = 1'b0; chav = 3'b100;
		#1 x = 1'b0; y = 1'b1; chav = 3'b101;
		#1 x = 1'b1; y = 1'b0; chav = 3'b110;
		#1 x = 1'b1; y = 1'b1; chav = 3'b111;
	 end
	endmodule // test_selecionavel