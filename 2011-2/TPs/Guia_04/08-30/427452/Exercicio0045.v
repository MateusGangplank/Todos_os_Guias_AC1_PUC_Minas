// -------------------------
// Exercicio0045 – FULL ADDER (Complemento)
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  full adder
// -------------------------
module fullAdder (output [5:0] s,
						input [5:0] a,
						input b);

// descrever por portas
 assign s [0] = ((~a[0]) ^ b);
 assign s [1] = ((~a[1]) ^ ((~a[0]) & b));
 wire t1 = (~a[1] & ((~a[0]) & b));
 assign s [2] = ((~a[2]) ^ t1);
 wire t2 = (~a[2] & t1);
 assign s [3] = ((~a[3]) ^ t2);
 wire t3 = (~a[3] & t2);
 assign s [4] = ((~a[4]) ^ t3);
 wire t4 = (~a[4] & t3);
 assign s [5] = ((~a[5]) ^ t4);

endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
		reg [5:0] x;
		reg y;
		wire [5:0] c2;
		
 fullAdder modulo (c2, x, y);

// ------------------------- parte principal
 initial begin
		$display("Exercicio 0045 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Test LU Complemento");
		
		x = 6'b000111;			y = 1;

 #1 $display("%b' + %b = %b", x, y, c2);

 end

endmodule // test_fullAdder

// SUGESTAO: EXPERIMENTE USAR PORTAS.
