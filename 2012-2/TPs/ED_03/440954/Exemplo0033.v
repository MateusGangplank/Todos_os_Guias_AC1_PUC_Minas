// -------------------------
// Exemplo0033 - operações (AND,OR) e (NAND,NOR) selecionável
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4(output sa01, output sa02, input a, input b, input chave);
	wire s1, s2, s3, s4, s5, s6, s7, s8;
	
	and AND1(s1, a, b);
	or OR1(s2, a, b);
	nand NAND1(s3, a, b);
	nor NOR1(s4, a, b);
	
	and AND2(s5, s1, ~chave);
	and AND3(s6, s2, ~chave);
	and AND4(s7, s3, chave);
	and AND5(s8, s4, chave);
	
	xor XOR1(sa01, s5, s7);
	xor XOR2(sa02, s6, s8);
	
endmodule // f4_gate

// -------------------------
// testef4
// -------------------------
module test_f4;
// ------------------------- definir dados
	reg a;
	reg b;
	reg chave;
	wire x;
	wire y;

	f4 modulo(x,y,a,b,chave);

// ------------------------- parte principal

	initial begin
		a=0; b=0; chave=0;
		
		$display("Exemplo0033 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test LU's module\n");

		$display("\nChave = 0\nOperacao AND-OR\na & b = s  ---  a | b = s");
		#1 $display("%b   %b = %b  ---  %b   %b = %b", a, b, x, a, b, y);
			a=0; b=1;
		#1 $display("%b   %b = %b  ---  %b   %b = %b", a, b, x, a, b, y);
			a=1; b=0;
		#1 $display("%b   %b = %b  ---  %b   %b = %b", a, b, x, a, b, y);
			a=1; b=1;
		#1 $display("%b   %b = %b  ---  %b   %b = %b", a, b, x, a, b, y);
		
		$display("\nChave = 1\nOperacao NAND-NOR\n~(a & b) = s  ---  ~(a | b) = s");
			a=0; b=0; chave=1;
		#1 $display(" (%b   %b) = %b  ---   (%b   %b) = %b", a, b, x, a, b, y);
			a=0; b=1;
		#1 $display(" (%b   %b) = %b  ---   (%b   %b) = %b", a, b, x, a, b, y);
			a=1; b=0;
		#1 $display(" (%b   %b) = %b  ---   (%b   %b) = %b", a, b, x, a, b, y);
			a=1; b=1;
		#1 $display(" (%b   %b) = %b  ---   (%b   %b) = %b", a, b, x, a, b, y);
	end

endmodule // test_f4
