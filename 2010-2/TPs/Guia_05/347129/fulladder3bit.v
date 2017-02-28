// ---------------------
// Full Adder
// Nome: Guilherme Augusto Freitas Costa
// Matricula: 347129
// ---------------------

// ---------------------
// -- half adder
// ---------------------

module halfadder (sum, cout, a, b);
 output sum, cout;
 input  a, b;

 xor XOR1 (sum, a, b);
 and AND1 (cout, a, b);

endmodule // halfadder

// ---------------------
// -- full adder
// ---------------------

module fulladder (sum, cout, cin, a, b);
	output sum, cout;
	input cin, a, b;
	
	halfadder HA1 (sum1, ha1, a, b);
	halfadder HA2 (sum, ha2, sum1, cin);
	or OR1 (cout, ha1, ha2);
	
endmodule // fulladder

// ---------------------
// -- full adder 3 bit
// ---------------------

module fulladder3bit (sum, x, y);
	output [3:0]sum;
	input [2:0]x, y;

	halfadder HA1 (sum[0], ha1, x[0], y[0]);
	fulladder FA1 (sum[1], fa1, ha1, x[1], y[1]);
	fulladder FA2 (sum[2], sum[3], fa1, x[2], y[2]);
endmodule //fulladder3bit

// ---------------------
// -- test full adder 3 bit
// ---------------------

module testfulladder;
	reg [2:0]x, y;
	wire [3:0]sum;
	
	fulladder3bit FA (sum, x, y);
	
	initial begin
	
		$display("Test Full Adder");
		// modificar valores para teste
		x = 3'b111;
		y = 3'b111;
	   #1 $displayb(x, " + " , y , " = " , sum);
		
	end
endmodule