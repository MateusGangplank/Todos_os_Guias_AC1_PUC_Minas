// ------------------------- 
// Exemplo0036 - DECREMENTO
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  decremento de 1
// -------------------------
module halfAdder (output s1, output s0, input a, input b);
	xor (s0, a, b);
	and (s1, a, b);
endmodule // halfAdder

module fullAdder (output carryOut, output s, input  a, input  b, input carryIn);
	wire s2,s1,s0;
	
	halfAdder HA1 (s1, s0, a, b);
	halfAdder HA2 (s2, s, s0, carryIn);
	or            (carryOut, s1, s2);
endmodule // fullAdder

module decremento1 (output [2:0]s, output overFlow, input [2:0]a);
	wire cout1,cout2,cout3;
	
	fullAdder FA1 (cout1, s[0], a[0], 1, 0);
	fullAdder FA2 (cout2, s[1], a[1], 1, cout1);
	fullAdder FA3 (cout3, s[2], a[2], 1, cout2);
	xor XOR4      (overFlow, cout3, 0);
endmodule // decremento1

module test_decremento1;
// ------------------------- definir dados
   reg [2:0]x;
	wire [2:0]soma;
	wire overF;
	
	decremento1 dec (soma, overF, x);
	
	initial begin: start
		x = 3'b000; 
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0036 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's decremento de 1");
      $monitor("%3b - 1 = %3b",x,soma); 
		repeat (7) begin
		#1 x = x + 1;
		end
   end
endmodule // test_decremento1

/*
    Exemplo0036 - Oswaldo Oliveira Paulino - 382175
    Test ALU's decremento de 1
    000 - 1 = 111
    001 - 1 = 000
    010 - 1 = 001
    011 - 1 = 010
    100 - 1 = 011
    101 - 1 = 100
    110 - 1 = 101
    111 - 1 = 110
*/