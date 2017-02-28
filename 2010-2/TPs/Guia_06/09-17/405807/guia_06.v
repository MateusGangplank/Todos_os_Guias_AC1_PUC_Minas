//---------------------
//-- Guia_06
//-- Nome: Júnior
//-- Matricula: 405807
//---------------------

//Exercício 01
//meia-soma normal
module halfadder(s, c, a, b);
	input  a, b;//variaveis
	output s, c;//s = saida, c = cout
	
	xor XOR1 (s, a, b);
	and AND1 (c, a, b);
	
endmodule 

//soma-completa
module fulladder (s,cout,cin,a,b);
	input  cin, a, b;
	output s, cout;
	
	wire s10,s11,s21;
	
	halfadder HALF1 (s10,s11,a,b);
	halfadder HALF2 (s,s21,cin,s10);
	or 		 OR1   (cout,s11,s21);
	
endmodule

//compara se é igual
module equalcomp (s,op,a,b);
	input  	   op;
	input[3:0] a, b;
	
	output     s;
	
	wire x1,x2,x3,x4,
		 o1,
		 a1,a2,
		 n1,n2;
	
	xor (x1,a[0],b[0]);
	xor (x2,a[1],b[1]);
	xor (x3,a[2],b[2]);
	xor (x4,a[3],b[3]);
	
	or  (o1,x1,x2,x3,x4);
	
	not (n1,o1);
	not (n2,op);
	
	and (a1,n1,op);
	and (a2,n2,o1);
	
	or  (s,a1,a2);
endmodule

//ex01
module ex01 ( s, c, a, b, op );
	output c;
	input  op;
	
	output[4:0] s;
	input[3:0]  a, b;
	
	wire cout1,cout2,cout3,cout4;
	
	halfadder HALF1 (s[0],cout1,a[0],b[0]);
	fulladder FULL1 (s[1],cout2,cout1,a[1],b[1]);
	fulladder FULL2 (s[2],cout3,cout2,a[2],b[2]);
	fulladder FULL3 (s[3],s[4],cout3,a[2],b[2]);
	
	equalcomp EQUALCOMP (c,op,a,b);
	
endmodule

//Exercício 02
//meia-subtração normal
module halfsub (s, bout, a, b);
	input  a, b;
	output s, bout;
	
	wire s0, na;
	
	xor XOR1 (   s, a, b);
	not NOT1 (  na, a);
	and AND1 (bout,na, b);
	
endmodule

//subtração completa
module fullsub (s0, s1, bin, a, b);
	input  bin, a, b;
	output s0, s1;
	
	wire s2,
		 bout0, bout1;
	
	halfsub SUB1 (s2,bout0, a,  b);
	halfsub SUB2 (s0,bout1,s2,bin);
	or      OR1  (s1,bout0, bout1);

endmodule

//compara maior e menor
module comp (ab,ba,a,b);
	output ab,ba;
	input[3:0] a,b;
	
	wire na0,na1,na2,na3,nb0,nb1,nb2,nb3,
		 a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,
		 no1,no2,no3,no4,
		 o1,o2;
	
	not NOT1 (na0,a[0]);
	not NOT2 (na1,a[1]);
	not NOT3 (na2,a[2]);
	not NOT4 (na3,a[3]);
	not NOT5 (nb0,b[0]);
	not NOT6 (nb1,b[1]);
	not NOT7 (nb2,b[2]);
	not NOT8 (nb3,b[3]);
	
	and AND1  (a1,na0,b0);
	and AND2  (a2,a0,nb0);
	and AND3  (a3,na1,b1);
	and AND4  (a4,a1,nb1);
	and AND5  (a5,na2,b2);
	and AND6  (a6,a2,nb2);
	and AND7  (a7,na3,b3);
	and AND8  (a8,a3,nb3);
	
	nor NOR1 (no1,a1,a2);
	nor NOR2 (no2,a3,a4);
	nor NOR3 (no3,a5,a6);
	nor NOR4 (no4,a7,a8);
	
	and AND9  ( a9,no1,a3);
	and AND10 (a10,na0,a4);
	and AND11 (a11,no2,no1,a5);
	and AND12 (a12,no2,no1,a6);
	and AND13 (a13,no3,no2,no1);
	and AND14 (a14,no3,no2,no1);
	
	or OR1 (ab,a14,a12,a10,a2);
	or OR2 (ba,a1,a9,a11,a13);

endmodule

module ex02 ( s, ab, ba, a, b );//ab = a > b e vice-versa
	output ab, ba;

	output[4:0] s;
	input[3:0]  a, b;
	
	wire out1,out2,out3;
	
	halfsub HALF1 (s[0],out1,a[0],b[0]);
	
	fullsub FULL1 (s[1],out2,out1,a[1],b[1]);
	fullsub FULL2 (s[2],out3,out2,a[2],b[2]);
	fullsub FULL3 (s[3],s[4],out3,a[3],b[3]);
	
	comp COMP1 (ab,ba,a,b);
	
endmodule

//Exercício 03
//mostra carry e overflow
module carryover ( c, o, a, b );
	input[3:0] a, b;
	output c, o;
	
	wire[4:0] s;
	
	halfadder HALF1 (s[0],cout1,a[0],b[0]);
	fulladder FULL1 (s[1],cout2,cout1,a[1],b[1]);
	fulladder FULL2 (s[2],cout3,cout2,a[2],b[2]);
	fulladder FULL3 (s[3],s[4],cout3,a[2],b[2]);
	
	wire n;
	
	or  OR1  (o,cout1,cout2,cout3,s[4]);
	
	not NOT1 (n,s[2]);
	and AND1 (o,n,s[4]);
endmodule

//mostra se é zero ou não
module zero ( z, a );
	output z;
	input[3:0] a;
	
	nor NOR1 ( z, a[0],a[1],a[2],a[3]);
endmodule

//módulo do ex03
module ex03 ( z, c, o, a, b );
	input[3:0] a, b;
	output z, c, o;
	
	wire z1,z2;
	
	zero ZERO1 (z1, a);
	zero ZERO2 (z2, b);
	
	and AND1 (z,z1,z2);
	
	carryover CARRYOVER ( c, o, a, b );

endmodule

//módulo de teste
module testes;

	reg[3:0] a, b;
	reg op;
	
	wire c1,
		 ab, ba,
		 z, c2, o;
	
	wire[4:0] s1,s2;
	
	ex01 EX1 ( s1, c, a, b, op );
	ex02 EX2 ( s2, ab, ba, a, b );
	ex03 EX3 ( z, c, o, a, b );

	initial begin
		#1 $display("ULA completa");
		   a = 5; b = 4; op = 0;
		#1 $monitor("a = %4b e b = %4b // soma: %5b, op: %b igual: %b // subtracao: %5b, a<b: %b, a>b %b // zero: %b, carry: %b, overflow: %b",a, b,s1,op,c1,s2,ab,ba,z,c2,o);
		#1 a = 2; b = 3; op = 0;
		#1 a = -2; b = 3; op = 1;
		#1 a = -6; b = -13; op = 1;
		#1 a = 12; b = 10; op = 1;
	end
endmodule
