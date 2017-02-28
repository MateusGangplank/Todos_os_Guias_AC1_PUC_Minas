// ------------------------- 
// Exemplo0026 - COMPLEMENTO DE 2
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  complemento de 2
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

module somadorAlg (output [3:0]s, input [2:0]a, input [2:0]b, input carryIn);
	wire x1,x2,x3,cout1,cout2,cout3;
	
	xor XOR1      (x1, b[0], carryIn);
	xor XOR2      (x2, b[1], carryIn);
	xor XOR3      (x3, b[2], carryIn);
	fullAdder FA1 (cout1, s[0], a[0], x1, carryIn);
	fullAdder FA2 (cout2, s[1], a[1], x2, cout1);
	fullAdder FA3 (cout3, s[2], a[2], x3, cout2);
	xor XOR4      (s[3], cout3, carryIn);
endmodule // somadorAlg

module test_somadorAlg;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	reg c;
	wire [3:0]soma;
	
	somadorAlg somadif (soma, x, y, c);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b001;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0026 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's somador algebrico");
		$display("-------------- CARRY-IN = 0 --------------");
      $monitor("%3b + %3b = %3b",x,y,soma); 
		#1 x = 3'b001; y = 3'b010; c = 0;  
		#1 x = 3'b010; y = 3'b011; c = 0;
		#1 x = 3'b011; y = 3'b100; c = 0;
		#1 x = 3'b100; y = 3'b101; c = 0;
		#1 x = 3'b101; y = 3'b110; c = 0;
		#1 x = 3'b110; y = 3'b111; c = 0;
		#1 x = 3'b111; y = 3'b111; c = 0;
		#1 x = 3'b000; y = 3'b111; c = 1;
		
		$display("-------------- CARRY-IN = 1 --------------");
	   $monitor("%3b - %3b = %3b",x,y,soma); 
		#1 x = 3'b001; y = 3'b110; c = 1;  
		#1 x = 3'b010; y = 3'b101; c = 1;
		#1 x = 3'b011; y = 3'b100; c = 1;
		#1 x = 3'b100; y = 3'b011; c = 1;
		#1 x = 3'b101; y = 3'b010; c = 1;
		#1 x = 3'b110; y = 3'b001; c = 1;
		#1 x = 3'b111; y = 3'b000; c = 1;
		#1 x = 3'b111; y = 3'b111; c = 1;
   end
endmodule // test_somadorAlg

/*
    Exemplo0026 - Oswaldo Oliveira Paulino - 382175
    Test ALU's somador algebrico
    -------------- CARRY-IN = 0 --------------
    000 + 001 = 0001
    001 + 010 = 0011
    010 + 011 = 0101
    011 + 100 = 0111
    100 + 101 = 1001
    101 + 110 = 1011
    110 + 111 = 1101
    111 + 111 = 1110
    -------------- CARRY-IN = 1 --------------
    000 - 111 = 1001
    001 - 110 = 1011
    010 - 101 = 1101
    011 - 100 = 1111
    100 - 011 = 0001
    101 - 010 = 0011
    110 - 001 = 0101
    111 - 000 = 0111
    111 - 111 = 0000
*/