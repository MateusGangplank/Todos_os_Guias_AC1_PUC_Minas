// -------------------------
// Exercicio0034 - Exercicio 4
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// ------------------------- 
//  f4_gate
// -------------------------
module f4 (output [7:0] s,
				input  [3:0] a,
				input  [3:0] b,
				input  [3:0] c);

// descrever por portas
 assign s [3:0]= (((a | b)& ~c) | ((a ^ b) & c));
 assign s [7:4]= ((~(a | b)) & ~c) | ((~(a ^ b)) & c);
endmodule // f4

module test_f4;
// ------------------------- definir dados
		reg  [3:0] w;
		reg  [3:0] x;
		reg  [3:0] y;
		wire  [7:0] z;

		f4 modulo (z, w, x, y);

// ------------------------- parte principal

	initial begin
		$display("Exercicio0034 - Pedro Henrique Alves M. de Carvalho - 427452"); 
		$display("Test LU's module");

		w = 4'b0011;		x = 4'b0101;		y = 0;
 
	// projetar testes do modulo
	#1 $display("%3b %3b = %3b",w,x,z);

	end

endmodule // test_f4