// -------------------------
// Exemplo0025 - C2
// Nome: Yousef Otacilio
// Matricula: 441714
// -------------------------
// -------------------------
// C2
// -------------------------

module somamais(output s1, output s2, input a);

	xor Xor1(s1,a,1);
	and And1(s2,a,1);
	
endmodule //somamais


module soma(output s1, output s2, input a, input b);

	xor Xor1(s1,a, b);
	and And1(s2,a, b);
	
endmodule //soma


module C2(output [3:0]S, input [2:0]a);
	
	wire s1, s2, s3;

	somamais soma1(S[0],     s1, a[0]);
	soma soma2(    S[1],s2,      a[1],s1);
	soma soma3(    S[2],S[3],    a[2],s2);
	
	
endmodule //C2

//------------------
module testC2;

reg [2:0] a;

wire [3:0] s;

C2 teste(s,a);
	

initial 	begin
	

	$display ("Exemplo0025 - Yousef -441714");
	$display ("C2");
	
	$monitor("a = %3b  C2 de a = %4b\n",a,s);


	#1 a = 6'b000;	
	#1	a = 6'b010;
	#1	a = 6'b011;
	#1	a = 6'b100;
	#1	a = 6'b101;
	#1	a = 6'b110;
	#1	a = 6'b111;
	

	end

endmodule //testSoma
