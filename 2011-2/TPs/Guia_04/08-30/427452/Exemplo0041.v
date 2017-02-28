// -------------------------
// Exemplo0041 – FULL ADDER
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
//  full adder
// -------------------------
module fullAdder (output [5:0] s,
						output carryOut,
						input [5:0] a,
						input [5:0] b,
						input carryIn);

// descrever por portas
 assign s [0] = ((a[0] ^ b[0]) ^ carryIn);
 assign s [1] = ((a[1] ^ b[1]) ^ ((a[0] & b[0]) | ((a[0] ^ b[0]) & carryIn) )); // como o resultado da primeira soma(ou S2) seria o carryIn agora ele esta sendo feito aqui
 assign s [2] = ((a[2] ^ b[2]) ^ ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & carryIn))) ));
 assign s [3] = ((a[3] ^ b[3]) ^ ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & carryIn))))) ));
 assign s [4] = ((a[4] ^ b[4]) ^ ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & carryIn))))))) ));
 assign CarryOut = ((a[5] ^ b[5]) ^ ((a[4] & b[4]) | ((a[4] ^ b[4]) & ((a[3] & b[3]) | ((a[3] ^ b[3]) & ((a[2] & b[2]) | ((a[2] ^ b[2]) & ((a[1] & b[1]) | ((a[1] ^ b[1]) & ((a[0] & b[0]) | ((a[0] ^ b[0]) & carryIn))))))))) ));

endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
		reg [5:0] x;
		reg [5:0] y;
		reg  carryI;
		wire carryO;
		wire [5:0] soma;
		
 fullAdder modulo (soma, carryO, x, y, carryI);

// ------------------------- parte principal
 initial begin
		$display("Exemplo 0041 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Test ALU’s full adder");
		
		x = 5'b000001;		y = 5'b000110;		carryI = 0;

 #1 $display("%b %b = %b", x, y, soma);

 end

endmodule // test_fullAdder