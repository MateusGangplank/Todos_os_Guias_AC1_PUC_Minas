// -------------------------
// Exemplo0022 - Subtração
// Nome: Yousef Otacilio
// Matricula: 441714
// -------------------------
// -------------------------
// Subtração
// -------------------------

module sub(output s1, output s2, input a, input b );

	xor Xor1(s1,a,b);
	and And1(s2,~a,b);
	
endmodule //sub


module subvai1(output s1, output s2, input a, input b, input v);
	
	wire w1, w2, w3;

	xor Xor1(w1,a,b);
	and And1(w2,~a,b);
	and And2(w3,~w1,v);
	xor Xor2(s1,w1,v);
	or or1(s2,w3,w2);
	
endmodule //subvai1
//

module subcompleta(output [3:0]S, input [2:0]a, input [2:0]b);
	
	wire s1, s2, s3, s4, s5, s6;

	sub sub1(S[0], s2, a[0], b[0]);
	subvai1 sub2(S[1],s4,a[1],b[1],s2);
	subvai1 sub3(S[2],S[3],a[2],b[2],s4);
	
	
endmodule //subcompleta

//------------------
module testSub;

reg [2:0] a;
reg [2:0] b;
wire [3:0] s;

subcompleta teste(s,a,b);
	

initial 	begin
	

	$display ("Exemplo0021 - Yousef -441714");
	$display ("Subtração Completa");
	
	$monitor("x = %3b  y = %3b  x+y = %4b\n",a,b,s);

	
	#1 a = 6'b000;	b = 6'b000;
	#1	a = 6'b001;	b = 6'b000;
	#1	a = 6'b001;	b = 6'b001;
	#1	a = 6'b111;	b = 6'b111;
	#1	a = 6'b111;	b = 6'b000;
	#1	a = 6'b100;	b = 6'b100;
	#1	a = 6'b001;	b = 6'b100;
	#1	a = 6'b010;	b = 6'b100;
	
	end

endmodule //testSub
