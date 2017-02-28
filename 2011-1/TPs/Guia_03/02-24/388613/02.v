// ---------------------
// Exe02 - Guia3
// Nome: Marden Santos Batista
// Matricula: 388613
// ---------------------
//Modulo Meia Soma
module halfAdder(s0, s1, a, b);
	output s0, s1;
	input a, b;
	wire w1, w2;
	AndNand AND01 (s0, a, b);
	OrNand OR01 (w1, a, b);
	NotNand NOT01 (w2, s0);
	AndNand AND02 (s1, w1, w2);
endmodule
//Modulo Or+Nand
module OrNand(s0, a, b);
	output s0;
	input a, b;
	wire w1, w2;
	nand NAND03 (w1, a, a);
	nand NAND04 (w2, b, b);
	nand NAND05 (s0, w1, w2);
endmodule
//Modulo And+Nand
module AndNand(s0, a, b);
	output s0;
	input a, b;
	wire w1;
	nand NAND01 (w1, a, b);
	nand NAND02 (s0, w1, w1);
endmodule
//Modulo Not+Nand
module NotNand(s0, a);
	output s0;
	input a;
	nand NAND06 (s0, a, a);
endmodule

module testExe02;
	reg reg1, reg2;
	wire s0, s1;

	halfAdder testHalfAdder(s0, s1, a, b);
	initial begin
		reg1 = 0;reg2 = 0;
	end
	initial begin

		$display("Exercicio 02 - Marden Batista - 388613");
		$display("Exe02: Half Adder com NAND\n");
		#1 $display("  reg1 + reg2 = s0 s1");
		#1 $monitor("  %d + %d =  %d    %d", reg1, reg2, s0, s1);
		#1 reg1 = 0; reg2 = 1;
		#1 reg1 = 1; reg2 = 0;
		#1 reg1 = 1; reg1 = 1;
	end
endmodule
