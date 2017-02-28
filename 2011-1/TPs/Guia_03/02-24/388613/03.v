// ---------------------
// Exe03 - Guia3
// Nome: Marden Santos Batista
// Matricula: 388613
// ---------------------
module meiaDif(s0, s1, a, b);
	output s0, s1;
	input a, b;
	wire w1;
	XorNand XOR01 (s1, a, b);
	NotNand NOT01 (w1, a);
	AndNand AND01 (s0, w1, b);
endmodule

module XorNand(s0, a, b);
	output s0;
	input a, b;
	wire w1, w2, w3;
	nand NAND03 (w1, a, b);
	nand NAND04 (w2, w1, a);
	nand NAND05 (w3, w1, b);
	nand NAND05 (s0, w2, w3);
endmodule

module AndNand(s0, a, b);
	output s0;
	input a, b;
	wire w1;
	nand NAND01 (w1, a, b);
	nand NAND02 (s0, w1, w1);
endmodule

module NotNand(s0, a);
	output s0;
	input a;
	nand NAND06 (s0, a, a);
endmodule

module testMeiaDif;
	reg reg1, reg2;
	wire w1,w2;

	meiaDif meiaDife(w1, w2, reg1, reg2);
	initial begin
		reg1 = 0;
		reg2 = 0;
	end

	initial begin

		$display("Exercicio 03 - Marden Batista - 388613");
		$display("Exe03 - Meia Diferença com NAND\n");
		#1 $display("  reg1 - reg2  = w1 w2");
		#1 $monitor("  %d - %d =  %d   %d", reg1, reg2, w1, w2);
		#1 reg1 = 0; reg2 = 1;
		#1 reg1 = 1; reg2 = 0;
		#1 reg1 = 1; reg2 = 1;
	end
endmodule
