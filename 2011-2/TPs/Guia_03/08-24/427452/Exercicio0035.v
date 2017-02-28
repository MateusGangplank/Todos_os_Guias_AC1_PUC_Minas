// -------------------------
// Exercicio0035 - Exercicio 5
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// ------------------------- 
//  f4_gate
// -------------------------
module f4 (output [6:0] s,
				input a,
				input b);

// descrever por portas
 assign s [0:0]= ~a;
 assign s [1:1]= a | b;
 assign s [2:2]= ~( a | b);
 assign s [3:3]= a & b;
 assign s [4:4]= ~(a & b);
 assign s [5:5]= a ^ b;
 assign s [6:6]= ~(a ^ b);
endmodule // f4

module test_f4;
// ------------------------- definir dados
		reg  x;
		reg  y;
		wire  [6:0] z;

		f4 modulo (z, x, y);

// ------------------------- parte principal

	initial begin
		$display("Exercicio0035 - Pedro Henrique Alves M. de Carvalho - 427452"); 
		$display("Test LU's module");

		x = 1;		y = 0;
 
	// projetar testes do modulo
	#1 $display("%3b %3b = %3b",x,y,z);

	end

endmodule // test_f4