// ------------------------- 
// Exercicio 0001 
// Nome: Guilherme Gideoni Albinati Batista 
// Matricula: 451565
// ------------------------- 
// ------------------------- 

// ------------------------- 
module test_base_01; 
// ------------------------- definir dados 
	reg [4:0] a; 
	reg [4:0] b; 
	reg [2:0] c; 
	reg [3:0] d;
	reg [4:0] e; 
	// ------------------------- parte principal 
	initial begin 
		$display("Exercicio0001 - Guilherme Gideoni Albinati Batista - 451565"); 
		$display("Operacoes"); 
		
		 a = 3 + 14;
		 $display("3 + 14 = %d = %5b", a, a); 
		 b = 3 * 8; 
		 $display("3 * 8 = %d = %5b", b, b);
		 c = 33 / 5;
		 $display("33/5 = %d = %5b", c, c); 
		 d = 25 - 11;
		 $display("25 - 11 = %d = %5b", d, d); 
		 e = 2 * 8 + 7 - 1;
		 $display("2 * 8 + 7 - 1 = %d = %5b", e, e); 
 
	end 
endmodule

/*
Exercicio0001 - Guilherme Gideoni Albinati Batista - 451565
Operacoes
3 + 14 = 17 = 10001
3 * 8 = 24 = 11000
33/5 = 6 =   110
25 - 11 = 14 =  1110
2 * 8 + 7 - 1 = 22 = 10110

*/ 