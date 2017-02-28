// Extra02
// Nome : Roger Rubens Machado
// Matricula: 435666


// xor gate

module xorgate (output [0:7]s, input [0:7]p, input [0:7]q); 
	assign s = p^q ; 
endmodule // xorgate

// Test xor Gate 

module testxorgate;
reg [0:7]a , b;
wire [0:7]s;

xorgate XOR1(s,a,b);
	
	initial begin:start
		a=8'b11111111; b=8'b11111111;
end
	initial begin
		$display("Extra02 Roger Rubens Machado - 430533");
		$display("Test XOR gate");
		
		$monitor("%b ^ %b = %b", a, b, s); 
	

	end
endmodule // testandgate