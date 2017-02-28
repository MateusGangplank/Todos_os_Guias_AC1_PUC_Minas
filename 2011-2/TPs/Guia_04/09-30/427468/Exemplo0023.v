// Exemplo0023 - EQUALS COMPARATOR
// Nome: Ursula Rosa Monteiro de Castro
// Matricula: 427468



module equals(output s, input a, input b);

	xnor XNOR1(s,a,b);

endmodule // equals


module Equals6(output s, input [0:5]a, input [0:5]b);

	wire [0:5]s0;

	equals E1(s0[5],a[5],b[5]);
	equals E2(s0[4],a[4],b[4]);
	equals E3(s0[3],a[3],b[3]);
	equals E4(s0[2],a[2],b[2]);
	equals E5(s0[1],a[1],b[1]);
	equals E6(s0[0],a[0],b[0]);
	and A1(s,s0[0],s0[1],s0[2],s0[3],s0[4],s0[5]);

endmodule //Equals6

//------------------
module testEquals;

reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
wire s;

Equals6 E1(s,a,b);
	

initial
	begin

	$display ("Exemplo0023 - Ursula Rosa - 427468");
	$display ("EQUALS COMPARATOR");
	
	#1 $display ("%b == %b = %b",a,b,s);
		a = 6'b110010;	b = 6'b000100;
	#1	$display ("%b == %b = %b",a,b,s);
		b = 6'b101010;
	#1	$display ("%b == %b = %b",a,b,s);
		a = 6'b010111;	b = 6'b111001;
	#1	$display ("%b == %b = %b",a,b,s);
	
	end

endmodule // testEquals