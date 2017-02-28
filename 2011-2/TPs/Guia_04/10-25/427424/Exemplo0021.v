// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: Jonatas Sena Ferreira
// Matricula: 427424


module fullAdder(output s1, output s0, input a, input b, input carryIn);

	wire s2;
	wire s3;
	wire s4;

	xor x1(s2,a,b);
	xor x2(s0,s2,carryIn);
	and a1(s3,a,b);
	and a2(s4,s2,carryIn);
	or o1(s1,s3,s4);

endmodule


module halfAdder(output s1, output s0, input a, input b);
	
	xor x1(s0,a,b);
	and a1(s1,a,b);
endmodule

module fullAdder6(output [0:5]s, input [0:5]a, input [0:5]b);

	wire [0:5]s0;

	halfAdder H1(s0[5],s[5],a[5],b[5]);
	fullAdder F1(s0[4],s[4],a[4],b[4],s0[5]);
	fullAdder F2(s0[3],s[3],a[3],b[3],s0[4]);
	fullAdder F3(s0[2],s[2],a[2],b[2],s0[3]);
	fullAdder F4(s0[1],s[1],a[1],b[1],s0[2]);
	xor X1(s0[0],b[0],s0[1]);
	xor X2(s[0],a[0],s0[0]);

endmodule


module testAdder;

reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
wire [0:5]s;

fullAdder6 F1(s,a,b);
	


initial
	begin
	
	
	$display ("Exemplo0021 - Jonatas Sena Ferreira - 427424");
	$display("Test ALU’s full adder");
	
	#1 $display ("%b + %b = %b",a,b,s);
		a = 6'b110010;	b = 6'b011100;
	#1	$display ("%b + %b = %b",a,b,s);
		b = 6'b111001;
	#1	$display ("%b + %b = %b",a,b,s);
		a = 6'b010111;	b = 6'b110100;
	#1	$display ("%b + %b = %b",a,b,s);
	
	end
endmodule //testAdder