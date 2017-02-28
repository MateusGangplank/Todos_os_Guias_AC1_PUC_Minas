//---------------------
//-- Guia_10
//-- Nome: Júnior
//-- Matricula: 405807
//---------------------

//Exercício 01
module ex01 ( p, q, r, s );//p == q' e q == q
	input  r, s;
	output p, q;
	
	reg n1,n2;
	
	nor NOR1(p,s,q);
	nor NOR2(q,r,p);
	
endmodule

//Exercício 02 e 04
module ex02 ( p, q, pr, cl, r, s );//p == q' e q == q
	input  r, s, pr, cl;
	output p, q;
	
	reg n1,n2;
	
	nand NAND1(p,pr,s,q);
	nand NAND2(q,cl,r,p);
	
endmodule

//Exercício 03
module ex03 ( p, q, pr, cl, d );//p == q' e q == q
	input  d, pr, cl;
	output p, q;
	
	reg  n1,n2;
	wire nd;
	
	not NOT1(nd,d);
	
	nand NAND1(p,pr, d,q);
	nand NAND2(q,cl,nd,p);
	
endmodule

//Exercício 05
module ex05 ( p, q, d );//p == q' e q == q
	input  d;
	output p, q;
	
	reg  n1,n2;
	wire nd;
	
	not NOT1(nd,d);
	
	nor NOR1(p, d,q);
	nor NOR2(q,nd,p);

endmodule

//Módulo de testes
module test;
	reg  r1,r2,s1,s2,d1,d2,cl1,pr1,cl2,pr2;
	wire p1,p2,p3,p4,q1,q2,q3,q4;
	
	ex01 EX1(p1,q1,r1,s1);
	ex02 EX2(p2,q2,pr1,cl1,r2,s2);
	ex03 EX3(p3,q3,pr2,cl2,d1);
	ex05 EX5(p4,q4,d2);

	initial begin
		r1=0; s1=0;
		$display("Teste do exercicio 1");
		$monitor("r = %b; s = %b: Q' = %b; Q = %b",r1,s1,p1,q1);
		#1 r1=1; s1=0;
		#1 r1=0;s1=0;
		#1 r1=0;s1=1;
		#1 r1=0;s1=0;
		#1 r1=1;s1=0;
		
		r2=0;s2=0;cl1=0;pr1=0;
		$display("");
		$display("Teste do exercicio 2 e 4");
		$monitor("r = %b; s = %b; Clear = %b; Preset = %b: Q' = %b; Q = %b",r2,s2,cl1,pr1,p2,q2);
		#1 r2=0;s2=0;cl1=0;pr1=0;
		#1 r2=0;s2=0;cl1=0;pr1=0;
		#1 r2=1;s2=0;cl1=1;pr1=0;
		#1 r2=0;s2=0;cl1=1;pr1=0;
		#1 r2=1;s2=0;cl1=1;pr1=1;
		#1 r2=0;s2=1;cl1=1;pr1=1;
		#1 r2=0;s2=1;cl1=1;pr1=1;
		#1 r2=0;s2=0;cl1=1;pr1=1;
		
		d1=0;cl2=0;pr2=0;
		$display("");
		$display("Teste do exercicio 3");
		$monitor("d = %b; Clear = %b: Preset = %b: Q' = %b; Q = %b",d1,cl2,pr2,p3,q3);
		#1 d1=1;cl2=0;pr2=0;
		#1 d1=0;cl2=1;pr2=0;
		#1 d1=1;cl2=1;pr2=0;
		#1 d1=0;cl2=0;pr2=1;
		#1 d1=1;cl2=0;pr2=1;
		#1 d1=1;cl2=1;pr2=1;
		#1 d1=0;cl2=1;pr2=1;
		
		
		d2 = 0;
		$display("");
		$display("Teste do exercicio 4");
		$monitor("d = %b: Q' = %b; Q = %b",d2,p4,q4);
		#1 d2 = 1;
		
	end
endmodule