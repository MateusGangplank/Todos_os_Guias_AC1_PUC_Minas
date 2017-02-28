// -------------------------
// Exemplo0032 - operações AND e OR selecionável
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4(output s, input a, input b, input chave);
	wire s1, s2, s3, s4;
	
	and AND1(s1, a, b);
	or OR1(s2, a, b);
	
	and ANDA(s3, s1, chave);
	and ANDB(s4, s2, ~chave);
	or OR2(s, s3, s4);
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

	f4 modulo(x,a,b,chave);

// ------------------------- parte principal

	initial begin
		a=0; b=0; chave=0;
		
		$display("Exemplo0032 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test LU's module\n");

		$display("\nChave = 0, operacao OR");
		$monitor("%b --- %b = %b", a, b, x);
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		
		#1 $display("\nChave = 1, operacao AND");
		#1 a=0; b=0; chave=1;
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
	end

endmodule // test_f4
