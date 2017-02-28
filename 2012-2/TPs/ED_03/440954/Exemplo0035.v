// -------------------------
// Exemplo0035 - operações NOT(a), NOT(b), OR, NOR, AND, NAND, XOR e XNOR selecionável em 03 bits
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4(output sa01, input a, input b, input [2:0]chave);
	wire s1, s2, s3, s4, s5, s6, s7, s8;
	wire p1, p2, p3, p4, p5, p6, p7, p8;
	
	not NOT1(s1, a);
	not NOT2(s2, b);
	or OR1(s3, a, b);
	nor NOR1(s4, a, b);
	and AND1(s5, a, b);
	nand NAND1(s6, a, b);
	xor XOR1(s7, a, b);
	xnor XNOR1(s8, a, b);
	
	and AND2(p1, s1, ~chave[0], ~chave[1], ~chave[2]);
	and AND3(p2, s2, chave[0], ~chave[1], ~chave[2]);
	and AND4(p3, s3, ~chave[0], chave[1], ~chave[2]);
	and AND5(p4, s4, chave[0], chave[1], ~chave[2]);
	and AND6(p5, s5, ~chave[0], ~chave[1], chave[2]);
	and AND7(p6, s6, chave[0], ~chave[1], chave[2]);
	and AND8(p7, s7, ~chave[0], chave[1], chave[2]);
	and AND9(p8, s8, chave[0], chave[1], chave[2]);
	
	or OR2(sa01,p1, p2, p3, p4, p5, p6, p7, p8);
	
endmodule // f4_gate

// -------------------------
// testef4
// -------------------------
module test_f4;
// ------------------------- definir dados
	reg a;
	reg b;
	reg [2:0]chave;
	wire x;

	f4 modulo(x,a,b,chave);

// ------------------------- parte principal

	initial begin
		
		
		$display("Exemplo0035 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test LU's module\n");
		
		$display("\nChave = 000\nOperacao NOT(a)\n~a = s");
			chave=3'b000;
			a=0;
		#1 $display("~%b = %b", a, x);
			a=1;
		#1 $display("~%b = %b", a, x);

		$display("\nChave = 001\nOperacao NOT(b)\n~b = s");
			chave=3'b001;
			b=0;
		#1 $display("~%b = %b", b, x);
			b=1;
		#1 $display("~%b = %b", b, x);
			
		$display("\nChave = 010\nOperacao OR\na | b = s");
			chave=3'b010;
			a=0; b=0;
		#1 $display("%b | %b = %b", a, b, x);
			a=0; b=1;
		#1 $display("%b | %b = %b", a, b, x);
			a=1; b=0;
		#1 $display("%b | %b = %b", a, b, x);
			a=1; b=1;
		#1 $display("%b | %b = %b", a, b, x);

		$display("\nChave = 011\nOperacao NOR\n~(a | b) = s");
			chave=3'b011;
			a=0; b=0;
		#1 $display("~(%b | %b) = %b", a, b, x);
			a=0; b=1;
		#1 $display("~(%b | %b) = %b", a, b, x);
			a=1; b=0;
		#1 $display("~(%b | %b) = %b", a, b, x);
			a=1; b=1;
		#1 $display("~(%b | %b) = %b", a, b, x);

		$display("\nChave = 100\nOperacao AND\na & b = s");
			chave=3'b100;
			a=0; b=0;
		#1 $display("%b & %b = %b", a, b, x);
			a=0; b=1;
		#1 $display("%b & %b = %b", a, b, x);
			a=1; b=0;
		#1 $display("%b & %b = %b", a, b, x);
			a=1; b=1;
		#1 $display("%b & %b = %b", a, b, x);

		$display("\nChave = 101\nOperacao NAND\n~(a & b) = s");
			chave=3'b101;
			a=0; b=0;
		#1 $display("~(%b & %b) = %b", a, b, x);
			a=0; b=1;
		#1 $display("~(%b & %b) = %b", a, b, x);
			a=1; b=0;
		#1 $display("~(%b & %b) = %b", a, b, x);
			a=1; b=1;
		#1 $display("~(%b & %b) = %b", a, b, x);

		$display("\nChave = 110\nOperacao XOR\na ^ b = s");
			chave=3'b110;
			a=0; b=0;
		#1 $display("%b ^ %b = %b", a, b, x);
			a=0; b=1;
		#1 $display("%b ^ %b = %b", a, b, x);
			a=1; b=0;
		#1 $display("%b ^ %b = %b", a, b, x);
			a=1; b=1;
		#1 $display("%b ^ %b = %b", a, b, x);

		$display("\nChave = 111\nOperacao XNOR\n~(a ^ b) = s");
			chave=3'b111;
			a=0; b=0;
		#1 $display("~(%b ^ %b) = %b", a, b, x);
			a=0; b=1;
		#1 $display("~(%b ^ %b) = %b", a, b, x);
			a=1; b=0;
		#1 $display("~(%b ^ %b) = %b", a, b, x);
			a=1; b=1;
		#1 $display("~(%b ^ %b) = %b", a, b, x);			

	end

endmodule // test_f4
