// ------------------------- 
// Exemplo0021 - FULL ADDER
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// -------------------------
//  full adder
// -------------------------
module fullAdder (output s1, output s0, input  a, input  b, input c);
	wire xorAB, and1, and2, and3;
	
	xor XOR1 (xorAB, a, b);
	and AND1 (and1, b, c);
	and AND2 (and2, a, c);
	and AND3 (and3, a, b);
	xor XOR2 (s0, xorAB, c);
	or  OR1  (s1, and1, and2, and3);
endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
   reg [2:0]x;
	reg [2:0]y;
	reg c;
	wire [2:0]soma;
	wire cout1, cout2, overflow;
	
	fullAdder modulo1 (cout1, soma[0], x[0], y[0], c);
	fullAdder modulo2 (cout2, soma[1], x[1], y[1], cout1);
	fullAdder modulo3 (overflow, soma[2], x[2], y[2], cout2);
	
	initial begin: start
		x = 3'b000; 
		y = 3'b000;
		c = 0;
	end
	
// ------------------------- parte principal
   initial begin
      $display("Exemplo0021 - Oswaldo Oliveira Paulino - 382175");
      $display("Test ALU's full adder");
      $monitor("%3b + %3b + %b = %b  %3b",x,y,c,overflow,soma); 
		#1 x = 3'b001; y = 3'b001; c = 0;  
		#1 x = 3'b010; y = 3'b010; c = 0;
		#1 x = 3'b011; y = 3'b011; c = 0;
		#1 x = 3'b100; y = 3'b100; c = 0;
		#1 x = 3'b101; y = 3'b101; c = 0;
		#1 x = 3'b110; y = 3'b110; c = 0;
		#1 x = 3'b111; y = 3'b111; c = 0;
		#1 x = 3'b111; y = 3'b111; c = 1;
   end
endmodule // test_fullAdder

/*
    Exemplo0021 - Oswaldo Oliveira Paulino - 382175
    Test ALU's full adder
    000 + 000 + 0 = 0  000
    001 + 001 + 0 = 0  010
    010 + 010 + 0 = 0  100
    011 + 011 + 0 = 0  110
    100 + 100 + 0 = 1  000
    101 + 101 + 0 = 1  010
    110 + 110 + 0 = 1  100
    111 + 111 + 0 = 1  110
    111 + 111 + 1 = 1  111
*/