// -------------------------
// Exercicio0042 – FULL ADDER (Subtrator)
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
 wire carry1 = ((~a[0] & b[0]) | (~(a[0] ^ b[0]) & carryIn));
 assign s [1] = ((a[1] ^ b[1]) ^ carry1);
 wire carry2 = ((~a[1] & b[1]) | (~(a[1] ^ b[1]) & carry1));
 assign s [2] = ((a[2] ^ b[2]) ^ carry2);
 wire carry3 = ((~a[2] & b[2]) | (~(a[2] ^ b[2]) & carry2));
 assign s [3] = ((a[3] ^ b[3]) ^ carry3);
 wire carry4 = ((~a[3] & b[3]) | (~(a[3] ^ b[3]) & carry3));
 assign s [4] = ((a[4] ^ b[4]) ^ carry4);
 wire carry5 = ((~a[4] & b[4]) | (~(a[4] ^ b[4]) & carry4));
 assign s [5] = ((a[5] ^ b[5]) ^ carry5);
 assign carryOut = ((~a[5] & b[5]) | (~(a[5] ^ b[5]) & carry5));

endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
		reg [5:0] x;
		reg [5:0] y;
		reg  carryI;
		wire carryO;
		wire [5:0] sub;
		
 fullAdder modulo (sub, carryO, x, y, carryI);

// ------------------------- parte principal
 initial begin
		$display("Exercicio 0042 - Pedro Henrique A. M. de Carvalho - 427452");
		$display("Test AU Subtrator");
		
		x = 5'b00110;		y = 5'b00101;		carryI = 0;

 #1 $display("%5b %5b = (%b)%5b", x, y, carryO, sub);
 #1 $display("%d - %d = (%d)%d", x, y, carryO, sub);

 end

endmodule // test_fullAdder