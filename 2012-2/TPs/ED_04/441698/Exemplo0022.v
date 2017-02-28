// -------------------------
// Exemplo0022
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

// -------------------------
// full Diff
// -------------------------
module fullDiff (soma, cout, a, b, cin);
	input a, b, cin; 
	output soma, cout;
	wire s1, s2, s3, c1, c2;
	
	xor (s1, a, b);
	not (s2, a);
	and (c1, s2, b);
	xor (soma, s1, cin);
	not (s3, s1);
	and (c2, s3, cin);
	or (cout, c1, c2);
endmodule

// -------------------------
// full Diff 3bits
// -------------------------
module fullDiff4 (soma, cout, a, b, cin);
	output [2:0] soma;
	output  cout;
	input [2:0] a, b;
	input cin;
	wire c3, c2, c1;
	
	  fullDiff  fa0 (soma[0], c1, a[0], b[0], cin);
	  fullDiff  fa1 (soma[1], c2, a[1], b[1], c1);
	  fullDiff  fa2 (soma[2], cout, a[2], b[2], c2);
endmodule

module test_fullDiff;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	reg carryIn;
	wire carryOut;
	wire [2:0] soma;
	
	fullDiff4 fa1(soma, carryOut, x, y, carryIn);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0022 - Marcio Enio Gonçalves Dutra Junior - 441698");
		$display("Test ALU's");
		
		#1 x = 3'b000; y = 3'b000; carryIn = 0;
		
		$monitor ("%b - %b = %b",x,y,soma);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b011; y = 3'b110;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b000; y = 3'b000;
	end
endmodule

