// -------------------------
// Exercicio0044 – FULL ADDER (Diferença)
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  full adder
// -------------------------
module fullAdder (output [5:0] s,
						input [5:0] a,
						input [5:0] b);

// descrever por portas
 assign s [0] = (a[0] ^ b[0]);
 assign s [1] = (a[1] ^ b[1]);
 assign s [2] = (a[2] ^ b[2]);
 assign s [3] = (a[3] ^ b[3]);
 assign s [4] = (a[4] ^ b[4]);
 assign s [5] = (a[5] ^ b[5]);

endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
		reg [5:0] x;
		reg [5:0] y;
		wire [5:0] diferente;
		
 fullAdder modulo (diferente, x, y);

// ------------------------- parte principal
 initial begin
		$display("Exercicio 0044 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Test LU Diferença");
		
		x = 6'b000111;		y = 6'b010101;

 #1 $display("%b %b = %b", x, y, diferente);

 end

endmodule // test_fullAdder