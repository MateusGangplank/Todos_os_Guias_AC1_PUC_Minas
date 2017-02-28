// Exemplo0027 - COMPARADOR
// Nome: Jonatas Sena Ferreira
// Matricula: 427424


module equals(output s, input a, input b);

	xnor XNOR1(s,a,b);

endmodule //equals

module Comparator(output s, input [0:5]a, input [0:5]b, input key);

	wire [0:5]s0;
	wire s1;

	equals E1(s0[5],a[5],b[5]);
	equals E2(s0[4],a[4],b[4]);
	equals E3(s0[3],a[3],b[3]);
	equals E4(s0[2],a[2],b[2]);
	equals E5(s0[1],a[1],b[1]);
	equals E6(s0[0],a[0],b[0]);
	and AND1(s1,s0[0],s0[1],s0[2],s0[3],s0[4],s0[5]);
	xor XOR1(s,s1,key);

endmodule //Comparator


//------------------
module testComparator;

reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
reg key = 1'b0;
wire s;

Comparator C1(s,a,b,key);
	

initial
	begin
	
	$display ("Exemplo0027 - Jonatas Sena Ferreira - 427424");
	$display ("COMPARADOR");
		
	#1 $display ("%b: \t%b == %b = %b",key,a,b,s);
		a = 6'b110010;	b = 6'b010100;
	#1 $display ("%b: \t%b == %b = %b",key,a,b,s);
		b = 6'b110110; key = 1'b1;
	#1 $display ("%b: \t%b != %b = %b",key,a,b,s);
		a = 6'b011111;	b = 6'b111000;
	#1 $display ("%b: \t%b != %b = %b",key,a,b,s);
	
	end

endmodule //testComparator