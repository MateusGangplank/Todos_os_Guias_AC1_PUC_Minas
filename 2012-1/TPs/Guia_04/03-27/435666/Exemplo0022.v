// Exemplo0022 - FULL SUBTRACTOR
// Nome: Julio Machado
// Matricula: 435666


module fullSubtractor(output s1, output s0, input a, input b, input carryIn);

	wire s2;
	wire s3;
	wire s4;
	wire s5;
	wire s6;

	not N1(s5,a);
	not N2(s6,s2);
	xor X1(s2,a,b);
	xor X2(s0,s2,carryIn);
	and A1(s3,s5,b);
	and A2(s4,s6,carryIn);
	or O1(s1,s3,s4);

endmodule //fullSubtractor


module halfSubtractor(output s1, output s0, input a, input b);
	
	wire s2;

	not N1(s2,a);
	xor X1(s0,a,b);
	and A1(s1,s2,b);
endmodule //halfSubtractor


module FullSubtractor6(output [0:5]s, input [0:5]a, input [0:5]b);

	wire [0:5]s0;

	halfSubtractor H1(s0[5],s[5],a[5],b[5]);
	fullSubtractor F1(s0[4],s[4],a[4],b[4],s0[5]);
	fullSubtractor F2(s0[3],s[3],a[3],b[3],s0[4]);
	fullSubtractor F3(s0[2],s[2],a[2],b[2],s0[3]);
	fullSubtractor F4(s0[1],s[1],a[1],b[1],s0[2]);
	xor X1(s0[0],b[0],s0[1]);
	xor X2(s[0],a[0],s0[0]);

endmodule //FullSubtractor

//------------------
module testAdder;

reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
wire [0:5]s;

FullSubtractor6 F1(s,a,b);
	

initial
	begin
	

	$display ("Exemplo0022 - Julio Machado -435666");
	$display ("FULL SUBTRAcTOR");
	
	#1 $display ("%b - %b = %b",a,b,s);
		a = 6'b100110;	b = 6'b010100;
	#1	$display ("%b - %b = %b",a,b,s);
		b = 6'b110110;
	#1	$display ("%b - %b = %b",a,b,s);
		a = 6'b011111;	b = 6'b111100;
	#1	$display ("%b - %b = %b",a,b,s);
	
	end

endmodule //testSubtractor
