// -------------------------
// Exemplo0026 -
// Nome: Thais Mairink 
// Matricula: 441710 
// ------------------------- 
module fullAdder (output s, output carryOut,input a, input b,input carryIn);

wire  p,q,w;

xor (p, a, b);
and (q, a,b);
xor (s, p, carryIn);
and (w, p, carryIn);

or  (carryOut, q,w);


endmodule

module fullAdder2 (output [2:0] soma, output  carryOut, input [2:0] a, input [2:0] b,input carryIn );

wire  c3, p, q;

          fullAdder  A (soma[0], p, a[0], b[0], carryIn);
	  fullAdder  B (soma[1], q, a[1], b[1], p);
	  fullAdder  C (soma[2], carryOut, a[2], b[2], q);

endmodule
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


module principal(output[2:0] saida, output carryOut, input[2:0] a,input[2:0] b, input carryIn, input chave);
	wire[2:0] s1, s2;
	wire c1, c2;
	
	diferenca2 FD1(s1,c1,a,b,carryIn);
	fullAdder2 FA1(s2,c2,a,b,carryIn);

	assign saida = chave? s1: s2;
	assign carryOut = chave? c1: c2;



endmodule


module test_diferenca;
	// ------------------------- definir dados
	reg [2:0] x;
	reg [2:0] y;
	reg chave;
	reg carryIn;
	wire carryOut;
	wire [2:0] saida, s;
	
	principal P( saida, carryOut,  x, y, carryIn,chave);
	// ------------------------- parte principal
	initial begin
		$display("Exemplo0026 - Thais Mairink - 441710");
		$display("");

		#1 x = 3'b000; y = 3'b000; carryIn = 0; chave = 1;
		
		$monitor ("%b - %b = %b chave:%b",x,y,saida, chave);
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b011; y = 3'b110;
		#1 x = 3'b000; y = 3'b000;
		chave = 0;
		$monitor ("%b + %b = %b chave:%b",x,y,saida, chave);
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b000; y = 3'b001;
		#1 x = 3'b001; y = 3'b000;
		#1 x = 3'b001; y = 3'b001;
		#1 x = 3'b001; y = 3'b011;
		#1 x = 3'b000; y = 3'b000;
		#1 x = 3'b011; y = 3'b110;
		#1 x = 3'b000; y = 3'b000;
	end
endmodule



