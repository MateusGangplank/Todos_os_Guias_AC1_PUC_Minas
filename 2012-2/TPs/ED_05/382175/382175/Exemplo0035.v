// ------------------------- 
// Exemplo0035 - SOMADOR ALG
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  somador algebrico
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

module somadorAlg (output [3:0]s, output zFlag, output plus, output minus, input [2:0]a, input [2:0]b);
	wire x1,x2,x3,cout1,cout2,cout3;
	
	xor XOR1      (x1, b[0], 1);
	xor XOR2      (x2, b[1], 1);
	xor XOR3      (x3, b[2], 1);
	fullAdder FA1 (cout1, s[0], a[0], x1, 1);
	fullAdder FA2 (cout2, s[1], a[1], x2, cout1);
	fullAdder FA3 (cout3, s[2], a[2], x3, cout2);
	xor XOR4      (s[3], cout3, 1);
	nor NOR1      (zFlag, s[0], s[1], s[2], s[3]);
	not NOT1      (plus, s[3]);
	assign minus = s[3];
endmodule // somadorAlg

module test_somadorAlg;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	wire [3:0]soma;
	wire zFlag;
	wire plus;
	wire minus;
	
	somadorAlg somadif (soma, zFlag, plus, minus, x, y);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b000;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0035 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's somador algebrico");
      $monitor("%3b - %3b = %3b | ZERO-flag = %b | PLUS = %b | MINUS = %b",x,y,soma,zFlag,plus,minus); 
		repeat (7) begin
		#1 y = y + 1;  
		end
		repeat (7) begin
		#1 x = x + 1;
		end
		
		#1 $display("\n----------------------------------\n");
		#1 x = 3'b000; y = 3'b000;
		repeat (7) begin
		#1 x = x + 1;  
		end
		repeat (7) begin
		#1 y = y + 1;
		end
   end
endmodule // test_somadorAlg

/*
    Exemplo0035 - Oswaldo Oliveira Paulino - 382175
    Test ALU's somador algebrico
    000 - 000 = 0000 | ZERO-flag = 1 | PLUS = 1 | MINUS = 0
    000 - 001 = 1111 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    000 - 010 = 1110 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    000 - 011 = 1101 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    000 - 100 = 1100 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    000 - 101 = 1011 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    000 - 110 = 1010 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    000 - 111 = 1001 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    001 - 111 = 1010 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    010 - 111 = 1011 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    011 - 111 = 1100 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    100 - 111 = 1101 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    101 - 111 = 1110 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    110 - 111 = 1111 | ZERO-flag = 0 | PLUS = 0 | MINUS = 1
    111 - 111 = 0000 | ZERO-flag = 1 | PLUS = 1 | MINUS = 0
    
    ----------------------------------
    
    000 - 000 = 0000 | ZERO-flag = 1 | PLUS = 1 | MINUS = 0
    001 - 000 = 0001 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    010 - 000 = 0010 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    011 - 000 = 0011 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    100 - 000 = 0100 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    101 - 000 = 0101 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    110 - 000 = 0110 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    111 - 000 = 0111 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    111 - 001 = 0110 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    111 - 010 = 0101 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    111 - 011 = 0100 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    111 - 100 = 0011 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    111 - 101 = 0010 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    111 - 110 = 0001 | ZERO-flag = 0 | PLUS = 1 | MINUS = 0
    111 - 111 = 0000 | ZERO-flag = 1 | PLUS = 1 | MINUS = 0
*/