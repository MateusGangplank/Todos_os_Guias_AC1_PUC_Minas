//---------------------
//--Nome:Pedro Siqueira  Matricula: 405830 
//--Guia_10  
//---------------------

module exercicio01 ( p, q, r, s );
	input  r, s;
	output p, q;
	reg n1,n2;
	nor NOR1(p,s,q);
	nor NOR2(q,r,p);
endmodule

module exercicio02 ( p, q, pr, cl, r, s );
	input  r, s, pr, cl;
	output p, q;
	reg n1,n2;
	nand NAND1(p,pr,s,q);
	nand NAND2(q,cl,r,p);
endmodule

module exercicio03 ( p, q, pr, cl, d );
	input  d, pr, cl;
	output p, q;
	reg  n1,n2;
	wire nd;
	not NOT1(nd,d);
	nand NAND1(p,pr, d,q);
	nand NAND2(q,cl,nd,p);
endmodule

module exercicio05 ( p, q, d );
	input  d;
	output p, q;
	reg  n1,n2;
	wire nd;
	not NOT1(nd,d);
	nor NOR1(p, d,q);
	nor NOR2(q,nd,p);
endmodule

// Teste:
module guia10;
	reg  r1,r2,s1,s2,d1,d2,clear1,preset1,clear2,preset2;
	wire qnot1,qnot2,qnot3,qnot4,q1,q2,q3,q4;
	exercicio01 EX1 (qnot1,q1,r1,s1);
	exercicio02 EX2 (qnot2,q2,preset1,clear1,r2,s2);
	exercicio03 EX3 (qnot3,q3,preset2,clear2,d1);
	exercicio05 EX5 (qnot4,q4,d2);
	initial begin
		r1=0; s1=0;
		$display("Exercicio 1");
		$monitor("r = %b; s = %b: Q' = %b; Q = %b",r1,s1,qnot1,q1);
		#1 r1=1; s1=0;
		#1 r1=0;s1=0;
		#1 r1=0;s1=1;
		#1 r1=0;s1=0;
		#1 r1=1;s1=0;
		r2=0;s2=0;clear1=0;preset1=0;
		$display("");
		$display("Exercicio 2");
		$monitor("r = %b; s = %b; CLR = %b; PR = %b: Q' = %b; Q = %b",r2,s2,clear1,preset1,qnot2,q2);
		#1 r2=0;s2=0;clear1=0;preset1=0;
		#1 r2=0;s2=0;clear1=0;preset1=0;
		#1 r2=1;s2=0;clear1=1;preset1=0;
		#1 r2=0;s2=0;clear1=1;preset1=0;
		#1 r2=1;s2=0;clear1=1;preset1=1;
		#1 r2=0;s2=1;clear1=1;preset1=1;
		#1 r2=0;s2=1;clear1=1;preset1=1;
		#1 r2=1;s2=1;clear1=1;preset1=1;
                #1 r2=1;s2=0;clear1=1;preset1=1;
                #1 r2=0;s2=1;clear1=1;preset1=1;
		d1=0;clear2=0;preset2=0;
		$display("");
		$display("Exercicio 3");
		$monitor("d = %b; CLR = %b: PR = %b: Q' = %b; Q = %b",d1,clear2,preset2,qnot3,q3);
		#1 d1=1;clear2=0;preset2=0;
		#1 d1=0;clear2=1;preset2=0;
		#1 d1=1;clear2=1;preset2=0;
		#1 d1=0;clear2=0;preset2=1;
		#1 d1=1;clear2=0;preset2=1;
		#1 d1=1;clear2=1;preset2=1;
		#1 d1=0;clear2=1;preset2=1;
		#1 d1=1;clear2=1;preset2=1;
		#1 d1=0;clear2=1;preset2=1;
		d2 = 0;
		$display("");
		$display("Exercicio 5");
		$monitor("d = %b: Q' = %b; Q = %b",d2,qnot4,q4);
		#1 d2 = 1;
	end
endmodule