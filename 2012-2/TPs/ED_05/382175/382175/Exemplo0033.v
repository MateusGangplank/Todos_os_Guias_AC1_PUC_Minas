// ------------------------- 
// Exemplo0033 - INCREMENTO
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  incremento de 1
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

module incremento1 (output [3:0]s, input [2:0]a);
	wire x1,cout1,cout2,cout3;
	
	fullAdder FA1 (cout1, s[0], a[0], 1, 0);
	fullAdder FA2 (cout2, s[1], a[1], 0, cout1);
	fullAdder FA3 (cout3, s[2], a[2], 0, cout2);
	xor XOR4      (s[3], cout3, 0);
endmodule // incremento1

module test_incremento1;
// ------------------------- definir dados
   reg [2:0]x;
	wire [3:0]soma;
	
	incremento1 inc (soma, x);
	
	initial begin: start
		x = 3'b000; 
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0033 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's incremento de 1");
      $monitor("%3b + 1 = %4b",x,soma); 
		repeat (7) begin
		#1 x = x + 1;
		end
   end
endmodule // test_incremento1

/*
    Exemplo0033 - Oswaldo Oliveira Paulino - 382175
    Test ALU's incremento de 1
    000 + 1 = 0001
    001 + 1 = 0010
    010 + 1 = 0011
    011 + 1 = 0100
    100 + 1 = 0101
    101 + 1 = 0110
    110 + 1 = 0111
    111 + 1 = 1000
*/