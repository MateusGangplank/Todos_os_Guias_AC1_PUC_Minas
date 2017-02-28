// ------------------------- 
// Exemplo0034 - SOMADOR ALGEBRICO
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// ------------------------- 

// -------------------------
//  somador
// -------------------------

module halfAdder (output s1, output s0, input a, input b);
	xor (s0, a, b);
	and (s1, a, b);
endmodule // halfAdder

module fullAdder (output carryOut, output s, input  a, input  b, input carryIn);
	wire s2,s1,s0;
	
// ------- Half Adder	
	halfAdder HA1 (s1, s0, a, b);
	halfAdder HA2 (s2, s, s0, carryIn);
	
// -------- porta OR	
	or            (carryOut, s1, s2);
	
endmodule // fullAdder

module somadorAlg (output [1:0]s, output carryOut, output OverFlowlow, output Flag, 
						 input [2:0]a, input [2:0]b, input carryIn);
	wire x1,x2,x3,ct1,ct2,ct3;
	
// --------- Portas Xors	
	xor XOR1      (x1, b[0], carryIn);
	xor XOR2      (x2, b[1], carryIn);
	xor XOR3      (x3, b[2], carryIn);
	xor XOR4      (OverFlowlow, ct3, carryIn);
	
// --------- Full Adder		
	fullAdder FA1 (ct1, s[0], a[0], x1, carryIn);
	fullAdder FA2 (ct2, s[1], a[1], x2, ct1);
	fullAdder FA3 (ct3, carryOut, a[2], x3, ct2);

// --------- Porta Nor
	nor NOR1      (Flag, s[0], s[1], carryOut, OverFlowlow);
endmodule // somadorAlg

module test_somadorAlg;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	reg c;
	wire [1:0]soma;
	wire ct;
	wire OverFlow;
	wire Flag;
	
	somadorAlg somadif (soma, ct, OverFlow, Flag, x, y, c);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b000;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0034 - Pedro Henrique Lima Pinheiro - 451605");
      $display("Test ALU's somador algebrico");
		$display(" \nCARRY IN = 0\n");
      $monitor("%3b + %3b = %b%b%2b --- flag 0 = %b",x,y,OverFlow,ct,soma,Flag); 
		repeat (7) begin
		#1 y = y + 1;  
		end
		repeat (7) begin
		#1 x = x + 1;
		end
		
		#1
		$display("\nCARRY IN = 1\n");
		#1 x = 3'b000; y = 3'b000; c = 1;
	   $monitor("%3b - %3b = %b%b%2b --- flag 0 = %b",x,y,OverFlow,ct,soma,Flag);
		repeat (7) begin
		#1 y = y + 1;  
		end
		repeat (7) begin
		#1 x = x + 1;
		end
   end
endmodule // test_somadorAlg

/*
    Exemplo0034 - Oswaldo Oliveira Paulino - 382175
    Test ALU's somador algebrico
    -------------- CARRY-IN = 0 --------------
    000 + 000 = 0000 | ZERO-flag = 1
    000 + 001 = 0001 | ZERO-flag = 0
    000 + 010 = 0010 | ZERO-flag = 0
    000 + 011 = 0011 | ZERO-flag = 0
    000 + 100 = 0100 | ZERO-flag = 0
    000 + 101 = 0101 | ZERO-flag = 0
    000 + 110 = 0110 | ZERO-flag = 0
    000 + 111 = 0111 | ZERO-flag = 0
    001 + 111 = 1000 | ZERO-flag = 0
    010 + 111 = 1001 | ZERO-flag = 0
    011 + 111 = 1010 | ZERO-flag = 0
    100 + 111 = 1011 | ZERO-flag = 0
    101 + 111 = 1100 | ZERO-flag = 0
    110 + 111 = 1101 | ZERO-flag = 0
    111 + 111 = 1110 | ZERO-flag = 0
    -------------- CARRY-IN = 1 --------------
    000 - 000 = 0000 | ZERO-flag = 1
    000 - 001 = 1111 | ZERO-flag = 0
    000 - 010 = 1110 | ZERO-flag = 0
    000 - 011 = 1101 | ZERO-flag = 0
    000 - 100 = 1100 | ZERO-flag = 0
    000 - 101 = 1011 | ZERO-flag = 0
    000 - 110 = 1010 | ZERO-flag = 0
    000 - 111 = 1001 | ZERO-flag = 0
    001 - 111 = 1010 | ZERO-flag = 0
    010 - 111 = 1011 | ZERO-flag = 0
    011 - 111 = 1100 | ZERO-flag = 0
    100 - 111 = 1101 | ZERO-flag = 0
    101 - 111 = 1110 | ZERO-flag = 0
    110 - 111 = 1111 | ZERO-flag = 0
    111 - 111 = 0000 | ZERO-flag = 1
*/