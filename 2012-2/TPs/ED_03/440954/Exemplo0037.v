// -------------------------
// Exemplo0037 - Comparador paracalcular se maior ou menor
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// f4_gate
// -------------------------
module f4(output s, input a, input b, input chave);
	wire s1, s2, s3, s4, s5, s6;
	
	not NOT1(s1, a);
	not NOT2(s2, b);
	
	and AND1(s3, s1, b);
	and AND2(s4, s2, a);
	
	and AND3(s5, s3, ~chave);
	and AND4(s6, s4, chave);
	
	or OR1(s, s5, s6);

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
		
		$display("Exemplo0037 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Extra07\n");

		$display("\nChave=0");
			a=0; b=0; chave=0;
		$monitor("%b --- %b = %b", a, b, x);
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
		
		#1 $display("\nChave=1");
		#1 a=0; b=0; chave=1;
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
	end

endmodule // test_f4
