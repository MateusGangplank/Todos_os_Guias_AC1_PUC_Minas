// -------------------------
//  Exemplo0035
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------

	module f4 (output s, input a, input b, input [2:0] c);

	wire and1;
	wire and2;
	wire and3;
	wire and4;
	wire and5;
	wire and6;
	wire and7;
	wire and8;
	wire xnor1;
	wire xor1;
	wire nor1;
	wire or1;
	wire nand1;

	not NOT1(not1, a);
	and AND2(and2, not1, ~c[0], ~c[1], ~c[2]);

	or OR1(or1, a, b);
	and AND3(and3, or1, c[0], ~c[1], ~c[2]);

	nor NOR1(nor1, a, b);
	and AND4(and4, nor1, ~c[0], c[1], ~c[2]);

	and AND1(and1, a, b);
	and AND5(and5, and1, c[0], c[1], ~c[2]);

	nand NAND1(nand1, a, b);
	and AND6(and6, nand1, ~c[0], ~c[1], c[2]);

	xor XOR1(xor1, a, b);
	and AND7(and7, xor1, c[0], ~c[1], c[2]);

 	xnor XNOR1(xnor1, a, b);
	and AND8(and8, xnor1, ~c[0], c[1], c[2]);

	or OR2(s, and2, and3, and4, and5, and6, and7, and8);

	endmodule

	module test_f4;
	// ------------------------- definir dados
 	reg x; 
 	reg y; 
	reg [2:0] c;
	wire s; 
	 
	f4 modulo (s, x, y, c);
	
	// ------------------------- parte principal 
	initial begin 
	$display("Exemplo0035 - Gustavo Barbosa - 427410");
	$display("Test");
		
   #1 x = 1; y = 1; c = 001;
	$monitor("Resultado chave = %3b\n x = %1b \t y = %1b \t Resultado -> %1b\n", c, x, y, s);
	#1 x = 0; y = 0; c = 001;
	#1 x = 1; y = 1; c = 010;
	
	
	end
	endmodule 