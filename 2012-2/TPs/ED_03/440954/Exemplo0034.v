// -------------------------
// Exemplo0034 - operações OR,NOR,XOR,XNOR selecionável em 02 bits
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4(output sa01, input a, input b, input [1:0]chave);
	wire s1, s2, s3, s4, s5, s6, s7, s8;
	
	or OR1(s1, a, b);
	nor NOR1(s2, a, b);
	xor XOR1(s3, a, b);
	xnor XNOR1(s4, a, b);
	
	and AND1(s5, s1, ~chave[0], ~chave[1]);
	and AND2(s6, s2, chave[0], ~chave[1]);
	and AND3(s7, s3, ~chave[0], chave[1]);
	and AND4(s8, s4, chave[0], chave[1]);
	
	or OR2(sa01, s5, s6, s7, s8);
	
endmodule // f4_gate

// -------------------------
// testef4
// -------------------------
module test_f4;
// ------------------------- definir dados
	reg a;
	reg b;
	reg [1:0]chave;
	wire x;

	f4 modulo(x,a,b,chave);

// ------------------------- parte principal

	initial begin
		
		$display("Exemplo0034 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test LU's module\n");

			chave=2'b00;
		$display("\nChave = 00\nOperacao OR\na | b = s");
			a=0; b=0;
		#1 $display("%b | %b = %b", a, b, x);
			a=0; b=1;
		#1 $display("%b | %b = %b", a, b, x);
			a=1; b=0;
		#1 $display("%b | %b = %b", a, b, x);
			a=1; b=1;
		#1 $display("%b | %b = %b", a, b, x);

			chave=2'b01;
		#1 $display("\nChave = 01\nOperacao NOR\n~(a | b) = s");
			a=0; b=0;
		#1 $display("~(%b | %b) = %b", a, b, x);
			a=0; b=1;
		#1 $display("~(%b | %b) = %b", a, b, x);
			a=1; b=0;
		#1 $display("~(%b | %b) = %b", a, b, x);
			a=1; b=1;
		#1 $display("~(%b | %b) = %b", a, b, x);

			chave=2'b10;	
		$display("\nChave = 10\nOperacao XOR\na ^ b = s");
			a=0; b=0;
		#1 $display("%b ^ %b = %b", a, b, x);
			a=0; b=1;
		#1 $display("%b ^ %b = %b", a, b, x);
			a=1; b=0;
		#1 $display("%b ^ %b = %b", a, b, x);
			a=1; b=1;
		#1 $display("%b ^ %b = %b", a, b, x);
		
			chave=2'b11;
		$display("\nChave = 11\nOperacao XNOR\n~(a | b) = s");
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
