//---------------------
//-- Guia_07
//-- Nome: Júnior
//-- Matricula: 405807
//---------------------

//meia-soma
module halfadder(s, c, a, b);
	input  a, b;//variaveis
	output s, c;//s = saida, c = cout
	
	xor XOR1 (s, a, b);
	and AND1 (c, a, b);
	
endmodule 

//meia-subtração
module halfsub (s, bout, a, b);
	input  a, b;
	output s, bout;
	
	wire s0, na;
	
	xor XOR1 (   s, a, b);
	not NOT1 (  na, a);
	and AND1 (bout,na, b);
	
endmodule

//Exercício01
module ex01(s, a, op);
	output[3:0] s;
	input [3:0] a;
	input 		op;
	
	xor XOR1(s[0],a[0],op);
	xor XOR2(s[1],a[1],op);
	xor XOR3(s[2],a[2],op);
	xor XOR4(s[3],a[3],op);
	
endmodule

//Exercício02
module ex02(s, a, op);
	output[4:0] s;
	input [3:0] a;
	input 		op;
	wire  [3:0]	s0;
	wire		c1,c2,c3;
	
	ex01 EX1 (s0, a, op);
	
	halfadder ADDER1 (s[0],c1,op,s0[0]);
	halfadder ADDER2 (s[1],c2,c1,s0[1]);
	halfadder ADDER3 (s[2],c3,c2,s0[2]);
	halfadder ADDER4 (s[3],s[4],c3,s0[3]);
endmodule

//Exercício03
module ex03(s, a, op);
	output[4:0] s;
	input [3:0] a;
	input 		op;
	wire  [3:0]	s0;
	wire		b1,b2,b3;
	
	ex01 EX1 (s0, a, op);
	
	halfsub SUB1 (s[0],b1,op,s0[0]);
	halfsub SUB2 (s[1],b2,b1,s0[1]);
	halfsub SUB3 (s[2],b3,b2,s0[2]);
	halfsub SUB4 (s[3],s[4],b3,s0[3]);
endmodule 

module testes;
	reg [3:0] a1,a2,a3; 
	wire[3:0] s1;
	wire[4:0] s2,s3;
	reg		 op;
	
	ex01 EX1 (s1,a1,op);
	ex02 EX2 (s2,a2,op);
	ex03 EX3 (s3,a3,op);
	
	initial begin
		$display("Modulo de testes guia07");
		#1 a1 = 4'b0010; a2 = 4'b0010; a3 = 4'b0010; op = 0;
		$monitor("OP = %b\n Ex01: a = %4b, s = %4b\n Ex02: a = %4b, s = %5b \n Ex03: a = %4b, s = %5b\n",op,a1,s1,a2,s2,a3,s3);
		#1 a1 = 4'b0010; a2 = 4'b0010; a3 = 4'b0010; op = 1;
		#1 a1 = 4'b1010; a2 = 4'b1010; a3 = 4'b1010; op = 0;
		#1 a1 = 4'b1010; a2 = 4'b1010; a3 = 4'b1010; op = 1;
		#1 a1 = 4'b1110; a2 = 4'b1110; a3 = 4'b1110; op = 0;
		#1 a1 = 4'b1110; a2 = 4'b1110; a3 = 4'b1110; op = 1;
		#1 a1 = 4'b0111; a2 = 4'b0111; a3 = 4'b0111; op = 0;
		#1 a1 = 4'b0111; a2 = 4'b0111; a3 = 4'b0111; op = 1;
	end
endmodule