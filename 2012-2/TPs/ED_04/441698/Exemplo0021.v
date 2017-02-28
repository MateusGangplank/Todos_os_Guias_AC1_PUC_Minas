// -------------------------
// Exemplo0021 - FULL ADDER
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

// -------------------------
// full adder
// -------------------------
module fullAdder (soma, cout, a, b, cin);
	input a, b, cin;
	output soma, cout;
	wire s1, c1, c2;
	
	xor (s1, a, b);
	and (c1, a, b);
	xor (soma, s1, cin);
	and (c2, s1, cin);
	or (cout, c1, c2);
endmodule

// -------------------------
// full adder 3bits
// -------------------------
module fullAdder4 (soma, cout, a, b, cin);
	output [2:0] soma;
	output  cout;
	input [2:0] a, b;
	input cin;
	wire c3, c2, c1;
	
	  fullAdder  fa0 (soma[0], c1, a[0], b[0], cin);
	  fullAdder  fa1 (soma[1], c2, a[1], b[1], c1);
	  fullAdder  fa2 (soma[2], cout, a[2], b[2], c2);
endmodule

module test_fullAdder;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	reg carryIn;
	wire carryOut;
	wire [2:0] soma;
	
	fullAdder4 fa1(soma, carryOut, x, y, carryIn);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0021 - Marcio Enio Gonçalves Dutra Junior - 441698");
		$display("Test ALU's full adder");
		
		#1 x = 3'b000; y = 3'b000; carryIn = 0;
		
		$monitor ("%b + %b = %b",x,y,soma);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b011; y = 3'b110;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b000; y = 3'b000;
	end
endmodule // test_fullAdder

