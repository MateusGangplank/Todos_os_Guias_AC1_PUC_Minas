// -------------------------
// Exemplo0021 - FULL ADDER 
// Nome: Thais Mairink 
// Matricula: 441710 
// ------------------------- 

// -------------------------
// full adder
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

module test_fullAdder;
// ------------------------- definir dados
reg [2:0] x;
reg [2:0] y;
reg carryIn;
wire carryOut;
wire [2:0] soma;

fullAdder2 fa1(soma, carryOut, x, y, carryIn);

// ------------------------- parte principal
	initial begin
		$display("Exemplo0021 - Thais Mairink - 441710");
		$display("Test ALU's full adder");
		
		#1 x = 3'b000; y = 3'b000; carryIn = 0;
		
		$monitor ("%b + %b = %b  " ,x , y, soma);
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