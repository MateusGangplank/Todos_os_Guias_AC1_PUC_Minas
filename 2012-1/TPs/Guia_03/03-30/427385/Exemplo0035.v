// ------------------------- 
// Exemplo0035 - F4 
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385
// -------------------------
 
// ------------------------- 
// --- selecionador
// ------------------------- 
module selecionador (output saida,
							input a,
							input b,
							input c,
							input d,
							input e,
							input f,
							input g,
							input h,
							input [2:0]chave);
	
	wire [7:0]s;
	wire saida_not1;
	wire saida_not2;
	wire saida_not3;
	
	not NOT1(saida_not1, chave[0]);
	not NOT1(saida_not2, chave[1]);
	not NOT1(saida_not3, chave[2]);
	
	and AND1(s[0], a, saida_not3, saida_not2, saida_not1);
	and AND2(s[1], b, saida_not3, saida_not2, chave[0]);
	and AND3(s[2], c, saida_not3, chave[1], saida_not1);
	and AND4(s[3], d, saida_not3, chave[1], chave[0]);
	and AND5(s[4], e, chave[2], saida_not2, saida_not1);
	and AND6(s[5], f, chave[2], saida_not2, chave[0]);
	and AND7(s[6], g, chave[2], chave[1], saida_not1);
	and AND8(s[7], h, chave[2], chave[1], chave[0]);
	
	or OR1(saida, s[0], s[1], s[2], s[3], s[4], s[5], s[6], s[7]);
	
endmodule // -- selecionador

// -------------------------
// --- f4_gate
// -------------------------
module f4 (output saida, input x, input y, input [2:0]flag);
	wire saida_not1;
	wire saida_not2;
	wire saida_or;
	wire saida_nor;
	wire saida_and;
	wire saida_nand;
	wire saida_xor;
	wire saida_xnor;
	
	not NOT1(saida_not1, x);
	not NOT2(saida_not2, y);
	
	or OR1(saida_or, x, y);
	nor NOR1(saida_nor, x, y);
	
	and AND1(saida_and, x, y);
	nand NAND1(saida_nand, x, y);
	
	xor XOR1(saida_xor, x, y);
	xnor XNOR1(saida_xnor, x, y);
	
	selecionador SEL1 (saida, saida_not1, saida_not2, saida_or, saida_nor, saida_and, saida_nand, saida_xor, saida_xnor, flag);

endmodule // -- f4

// -------------------------
// --- modulo de teste
// -------------------------
module test_f4;
	
	reg  x;
	reg  y;
	reg  [2:0]f;
	wire z;
	
	f4 modulo (z, x, y, f);
	
	// -- parte principal
	initial begin
	
	$display("Exemplo0035 - Ana Cristina Pereira Teixeira - 427385");
	$display("Test LU's module\n");
   $display("Legenda da chave: 000-NOT A; 001-NOT B; 010-OR; 011-NOR; 100-AND; 101-NAND; 110-XOR; 111-XNOR\n");
	
	#1 x = 'b0; y = 'b0; f = 000;
	$monitor("Flag = %b \t x = %b\t y = %b\t Saida = %b", f, x, y, z);
	#1 x = 'b0; y = 'b0; f = 001;
	#1 x = 'b0; y = 'b0; f = 010;
	#1 x = 'b0; y = 'b0; f = 011;
	#1 x = 'b0; y = 'b0; f = 100;
	#1 x = 'b0; y = 'b0; f = 101;
	#1 x = 'b0; y = 'b0; f = 110;
	#1 x = 'b0; y = 'b0; f = 111;
	
	#1 x = 'b0; y = 'b1; f = 000;
	$display("\n");
	#1 x = 'b0; y = 'b1; f = 001;
	#1 x = 'b0; y = 'b1; f = 010;
	#1 x = 'b0; y = 'b1; f = 011;
	#1 x = 'b0; y = 'b1; f = 100;
	#1 x = 'b0; y = 'b1; f = 101;
	#1 x = 'b0; y = 'b1; f = 110;
	#1 x = 'b0; y = 'b1; f = 111;
	
	#1 x = 'b1; y = 'b0; f = 000;
	$display("\n");
	#1 x = 'b1; y = 'b0; f = 001;
	#1 x = 'b1; y = 'b0; f = 010;
	#1 x = 'b1; y = 'b0; f = 011;
	#1 x = 'b1; y = 'b0; f = 100;
	#1 x = 'b1; y = 'b0; f = 101;
	#1 x = 'b1; y = 'b0; f = 110;
	#1 x = 'b1; y = 'b0; f = 111;
	
	#1 x = 'b1; y = 'b1; f = 000;
	$display("\n");
	#1 x = 'b1; y = 'b1; f = 001;
	#1 x = 'b1; y = 'b1; f = 010;
	#1 x = 'b1; y = 'b1; f = 011;
	#1 x = 'b1; y = 'b1; f = 100;
	#1 x = 'b1; y = 'b1; f = 101;
	#1 x = 'b1; y = 'b1; f = 110;
	#1 x = 'b1; y = 'b1; f = 111;
	
	end
endmodule // -- test_f4
// --- previsao de testes
// -- Legenda da chave: 000-NOT A; 001-NOT B; 010-OR; 011-NOR; 100-AND; 101-NAND; 110-XOR; 111-XNOR

// -- Flag = 000 	 x = 0	 y = 0	 Saida = 1
// -- Flag = 001 	 x = 0	 y = 0	 Saida = 1
// -- Flag = 010 	 x = 0	 y = 0	 Saida = 0
// -- Flag = 011 	 x = 0	 y = 0	 Saida = 1
// -- Flag = 100 	 x = 0	 y = 0	 Saida = 0
// -- Flag = 101 	 x = 0	 y = 0	 Saida = 1
// -- Flag = 110 	 x = 0	 y = 0	 Saida = 0
// -- Flag = 111 	 x = 0	 y = 0	 Saida = 1
// --
// --
// -- Flag = 000 	 x = 0	 y = 1	 Saida = 1
// -- Flag = 001 	 x = 0	 y = 1	 Saida = 0
// -- Flag = 010 	 x = 0	 y = 1	 Saida = 1
// -- Flag = 011 	 x = 0	 y = 1	 Saida = 0
// -- Flag = 100 	 x = 0	 y = 1	 Saida = 0
// -- Flag = 101 	 x = 0	 y = 1	 Saida = 1
// -- Flag = 110 	 x = 0	 y = 1	 Saida = 1
// -- Flag = 111 	 x = 0	 y = 1	 Saida = 0
// -- 
// -- 
// -- Flag = 000 	 x = 1	 y = 0	 Saida = 0
// -- Flag = 001 	 x = 1	 y = 0	 Saida = 1
// -- Flag = 010 	 x = 1	 y = 0	 Saida = 1
// -- Flag = 011 	 x = 1	 y = 0	 Saida = 0
// -- Flag = 100 	 x = 1	 y = 0	 Saida = 0
// -- Flag = 101 	 x = 1	 y = 0	 Saida = 1
// -- Flag = 110 	 x = 1	 y = 0	 Saida = 1
// -- Flag = 111 	 x = 1	 y = 0	 Saida = 0
// -- 
// -- 
// -- Flag = 000 	 x = 1	 y = 1	 Saida = 0
// -- Flag = 001 	 x = 1	 y = 1	 Saida = 0
// -- Flag = 010 	 x = 1	 y = 1	 Saida = 1
// -- Flag = 011 	 x = 1	 y = 1	 Saida = 0
// -- Flag = 100 	 x = 1	 y = 1	 Saida = 1
// -- Flag = 101 	 x = 1	 y = 1	 Saida = 0
// -- Flag = 110 	 x = 1	 y = 1	 Saida = 0
// -- Flag = 111 	 x = 1	 y = 1	 Saida = 1
