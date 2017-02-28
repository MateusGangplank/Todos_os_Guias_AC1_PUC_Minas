// Exemplo0024 - DIFFERENCE COMPARATOR
// Nome: Jonatas Sena Ferrreira
// Matricula: 427424


module different(output s, input a, input b);

	xor XOR1(s,a,b);

endmodule //different
 
module Different6(output s, input [0:5]a, input [0:5]b);

	wire [0:5]s0;

	different E1(s0[5],a[5],b[5]);
	different E2(s0[4],a[4],b[4]);
	different E3(s0[3],a[3],b[3]);
	different E4(s0[2],a[2],b[2]);
	different E5(s0[1],a[1],b[1]);
	different E6(s0[0],a[0],b[0]);
	or OR1(s,s0[0],s0[1],s0[2],s0[3],s0[4],s0[5]);

endmodule // Different6

//------------------
module testDifference;

reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
wire s;

Different6 E1(s,a,b);


initial
	begin

	$display ("Exemplo0024 - Jonatas Sena Ferreira - 427424");
	$display ("DIFFERENCE COMPARATOR");
	
	#1 $display ("%b != %b = %b",a,b,s);
		a = 6'b110010;	b = 6'b000100;
	#1	$display ("%b != %b = %b",a,b,s);
		b = 6'b111100;
	#1	$display ("%b != %b = %b",a,b,s);
		a = 6'b110111;	b = 6'b111010;
	#1	$display ("%b != %b = %b",a,b,s);
	
	end

endmodule //testDifference