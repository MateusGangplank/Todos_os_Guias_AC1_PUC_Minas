// ------------------------- 
// Exemplo0032 - SEL 
// Nome: Michelle da Costa Silva 
// Matricula: 427448
// -------------------------
 
// ------------------------- 
// sel_gate 
// ------------------------- 

   module sel (output [3:0]saida_and, output [3:0]saida_or, output [7:0]saida, output [3:0]s, output [0:0]saida_not, input [3:0]entrada1, input [3:0]entrada2, input [0:0]chave);
					
	 and AND1(saida_and[0], entrada1[0], entrada2[0]);
    and AND2(saida_and[1], entrada1[1], entrada2[1]);
    and AND3(saida_and[2], entrada1[2], entrada2[2]);
    and AND4(saida_and[3], entrada1[3], entrada2[3]);

	 or OR1(saida_or[3], entrada1[3], entrada2[3]);
    or OR2(saida_or[2], entrada1[2], entrada2[2]);
    or OR3(saida_or[1], entrada1[1], entrada2[1]);
    or OR4(saida_or[0], entrada1[0], entrada2[0]); 
	
	 and AND5(saida[0], saida_and[0], chave[0]);
    and AND6(saida[1], saida_and[1], chave[0]);
    and AND7(saida[2], saida_and[2], chave[0]);
    and AND8(saida[3], saida_and[3], chave[0]);
	 
	 not NOT1(saida_not[0], chave[0]);
	 
    and AND9(saida[4], saida_or[0], saida_not[0]);
    and AND10(saida[5], saida_or[1], saida_not[0]);
    and AND11(saida[6], saida_or[2], saida_not[0]);
    and AND12(saida[7], saida_or[3], saida_not[0]);
	 
	 or OR5(s[3], saida[3], saida[7]);
    or OR6(s[2], saida[2], saida[6]);
    or OR7(s[1], saida[1], saida[5]);
    or OR8(s[0], saida[0], saida[4]); 

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
	 wire [7:0] z;
	 wire [3:0] m;
	 wire [0:0] g;

	 
// ------------------------- instancia 

    sel modulo (w, k, z, m, g, x, y, c);
	  
// ------------------------- parte principal 
initial begin
      $display("Exemplo0032 - Michelle da Costa Silva");
      $display("Test LU's module");
      #1 x = 4'b0101; y = 4'b1010; c = 0;
		$monitor("Resultado Chave = %1b\n x = %4b \t y = %4b \t Resultado -> %4b\n", c, x, y, m);
		#1 x = 4'b0101; y = 4'b1010; c = 1;
		
		#1 x = 4'b1111; y = 4'b0000; c = 0;
		#1 x = 4'b1111; y = 4'b0000; c = 1;
		
		#1 x = 4'b1001; y = 4'b1000; c = 0;
		#1 x = 4'b1001; y = 4'b1000; c = 1;
		end
endmodule // test_sel