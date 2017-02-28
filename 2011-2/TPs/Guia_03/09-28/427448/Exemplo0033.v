// ------------------------- 
// Exemplo0033 - SEL 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------
 
// ------------------------- 
// sel_gate 
// ------------------------- 

   module sel (output [3:0]saida_and,
	            output [3:0]saida_or, 
					output [3:0]saida_nand, 
					output [3:0]saida_nor,
					output [0:0]saida_not, 
					output [7:0]s1, 
					output [7:0]s2,
	            output [3:0]saida0,
					output [3:0]saida1,
					input [3:0]entrada1, 
					input [3:0]entrada2,
					input [0:0]chave);
					
	 and AND_1(saida_and[0], entrada1[0], entrada2[0]);
    and AND_2(saida_and[1], entrada1[1], entrada2[1]);
    and AND_3(saida_and[2], entrada1[2], entrada2[2]);
    and AND_4(saida_and[3], entrada1[3], entrada2[3]);

	 or OR_1(saida_or[0], entrada1[0], entrada2[0]);
    or OR_2(saida_or[1], entrada1[1], entrada2[1]);
    or OR_3(saida_or[2], entrada1[2], entrada2[2]);
    or OR_4(saida_or[3], entrada1[3], entrada2[3]); 
	 
	 nand NAND1(saida_nand[0], entrada1[0], entrada2[0]);
    nand NAND2(saida_nand[1], entrada1[1], entrada2[1]);
    nand NAND3(saida_nand[2], entrada1[2], entrada2[2]);
    nand NAND4(saida_nand[3], entrada1[3], entrada2[3]);

	 nor NOR1(saida_nor[0], entrada1[0], entrada2[0]);
    nor NOR2(saida_nor[1], entrada1[1], entrada2[1]);
    nor NOR3(saida_nor[2], entrada1[2], entrada2[2]);
    nor NOR4(saida_nor[3], entrada1[3], entrada2[3]);
	 
	 not NOT1(saida_not[0], chave[0]);
	 
	 and AND1(s1[0], saida_and[0], saida_not[0]);
    and AND2(s1[1], saida_and[1], saida_not[0]);
    and AND3(s1[2], saida_and[2], saida_not[0]);
    and AND4(s1[3], saida_and[3], saida_not[0]);

    and AND5(s1[4], saida_or[0], saida_not[0]);
    and AND6(s1[5], saida_or[1], saida_not[0]);
    and AND7(s1[6], saida_or[2], saida_not[0]);
    and AND8(s1[7], saida_or[3], saida_not[0]);
	 
	 and AND9(s2[0], saida_nand[0], chave[0]);
    and AND10(s2[1], saida_nand[1], chave[0]);
    and AND11(s2[2], saida_nand[2], chave[0]);
    and AND12(s2[3], saida_nand[3], chave[0]);

    and AND13(s2[4], saida_nor[0], chave[0]);
    and AND14(s2[5], saida_nor[1], chave[0]);
    and AND15(s2[6], saida_nor[2], chave[0]);
    and AND16(s2[7], saida_nor[3], chave[0]);
	 
	 or OR1(saida0[0], s1[0], s2[0]);
    or OR2(saida0[1], s1[1], s2[1]);
    or OR3(saida0[2], s1[2], s2[2]);
    or OR4(saida0[3], s1[3], s2[3]); 
	 
	 or OR5(saida1[0], s1[4], s2[4]);
    or OR6(saida1[1], s1[5], s2[5]);
    or OR7(saida1[2], s1[6], s2[6]);
    or OR8(saida1[3], s1[7], s2[7]);

    endmodule //sel

// ------------------------- 
// -- test f4
// -------------------------
     module test_sel; 
// ------------------------- definir dados 
    reg  [3:0] x;
	 reg  [3:0] y;
	 reg  [0:0] c;
	 
	 wire [3:0] w;
	 wire [3:0] k;
	 wire [3:0] r;
	 wire [3:0] s;
	 wire [0:0] a;
	 wire [7:0] h;
	 wire [7:0] p;
	 wire [3:0] s0;
	 wire [3:0] s1;

// ------------------------- instancia 

    sel modulo (w, k, r, s, a, h, p, s0, s1, x, y, c);
	 
	  
// ------------------------- parte principal 
initial begin
      $display("Exemplo0033 - Michelle da Costa Silva");
      $display("Test LU's module");
      #1 x = 4'b0101; y = 4'b1010; c = 0;
		$monitor("Resultado Chave = %1b\n x = %4b \t y = %4b \t Resultado = %4b \t Resultado = %4b\n", c, x, y, s0, s1);
		#1 x = 4'b0101; y = 4'b1010; c = 1;
		
		#1 x = 4'b1111; y = 4'b0000; c = 0;
		#1 x = 4'b1111; y = 4'b0000; c = 1;
		
		#1 x = 4'b1001; y = 4'b1000; c = 0;
		#1 x = 4'b1001; y = 4'b1000; c = 1;
		end
endmodule // test_sel