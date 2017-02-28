// -------------------------
// Exemplo0022 - FULL DIFF
// Nome: Thais Mairink 
// Matricula: 441710 
// ------------------------- 

// -------------------------
// full diff
// -------------------------
module diferenca (output diff, output carryOut, input a,input b, input carryIn);

	wire s1, s2, s3, c1, c2;

	xor (s1, a, b);
	not (s2, a);
	and (c1, s2, b);
	xor (diff, s1, carryIn);
	not (s3, s1);
	and (c2, s3, carryIn);
	or (carryOut, c1, c2);

endmodule

// -------------------------
// full Diff 3bits
// -------------------------
module diferenca2 (output [2:0] diff, output carryOut,input [2:0] a,input [2:0] b,input carryIn);
	wire  p, q;
	
	  diferenca  A (diff[0], p, a[0], b[0], carryIn);
	  diferenca  B (diff[1], q, a[1], b[1], p);
	  diferenca  C (diff[2], carryOut, a[2], b[2], q);
endmodule

module test_diferenca;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	reg carryIn;
	wire carryOut;
	wire [2:0] d;
	
	diferenca2 D(d, carryOut, x, y, carryIn);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0022 - Thais Mairink - 441710");
		$display("Subtrator");
		
		#1 x = 3'b000; y = 3'b000; carryIn = 0;
		
		$monitor ("%b - %b = %b",x,y,d);
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

