module ex01 ( s, a, b, c, d );
	input a, b, c, d;
	output s;
	
	wire	and1,and2,and3,
			na,nb,nd;
	
	not NOT1 (na, a);
	not NOT2 (nb, b);
	not NOT3 (nd, d);
	
	and AND1( and1, a, nb, c );
	and AND2( and2, a, b, nd );
	and AND3( and3, na, c );
	
	or OR1 ( s, and1, and2, and3 );
endmodule

module ex02 ( s, a, b, c, d );
	input a, b, c, d;
	output s;
	
	wire	and1,and2,
			nb,nc,nd;
	
	not NOT1 (nb, b);
	not NOT2 (nc, c);
	not NOT3 (nd, d);
	
	and AND1( and1, nb, nc, nd );
	and AND2( and2, a, nb, d );
	
	or OR1 ( s, and1, and2, nc );
	
endmodule

module ex03 ( s, a, b, c, d, e );
	input a, b, c, d, e;
	output s;
	
	wire	and1,and2,and3,
			na,nb,nc,nd;
	
	not NOT1 (na, a);
	not NOT2 (nb, b);
	not NOT3 (nc, c);
	not NOT3 (nd, d);
	
	and AND1( and1, na, nc, d );
	and AND2( and2, nb, nd, e );
	and AND3( and3, c, e );
	
	or OR1 ( s, and1, and2, and3 );	
endmodule

module ex04 ( s, a, b, c, d );
	input a, b, c, d;
	output s;
	
	wire	nand1,nand2,nand3,nand4,nand5,nand6, nand7, nand8, nand9,
			na,nb,nd;
	
	not NOT1 (na, a);
	not NOT2 (nb, b);
	not NOT3 (nd, d);
	
	nand NAND1( nand1, a, nb, c );
	nand NAND2( nand2, a, b, nd );
	nand NAND3( nand3, na, c );
	nand NAND4( nand4, nand1, nand1 );
	nand NAND5( nand5, nand2, nand2 );
	nand NAND6( nand6, nand3, nand3 );
	
	nand NAND7( nand7, nand4, nand4 ); 
	nand NAND8( nand8, nand5, nand5 );
	nand NAND9( nand9, nand6, nand6 );
	nand NAND0( s, nand7, nand8, nand9);
	
	or OR1 ( s, nand1, nand2, nand3 );

endmodule

module ex05 ( s, a, b, c, d );
	input a, b, c, d;
	output s;
	
	wire	nor1,nor2,nor3,nor4,nor5,nor6,nor7,nor8,
			nb,nc,nd;
	
	not NOT1 (nb, b);
	not NOT2 (nc, c);
	not NOT3 (nd, d);
	
	nor NOR1( nor1, nb, nb );
	nor NOR2( nor2, nc, nc );
	nor NOR3( nor3, nd, nd );
	nor NOR4( nor4, nor1, nor2, nor3 );
	
	nor NOR5( nor5, a, a );
	nor NOR6( nor6, nb, nb );
	nor NOR7( nor7, d, d );
	
	nor NOR8( nor8, nor4, nor7, c );	
	nor NOR9( s, nor8, nor8);
endmodule

module teste;
	
	reg	a1, b1, c1, d1,
			a2, b2, c2, d2,
			a3, b3, c3, d3, e,
			a4, b4, c4, d4,
			a5, b5, c5, d5;
	wire 	s1, s2, s3, s4, s5;

	ex01 EX1 ( s1, a1, b1, c1, d1 );
	ex02 EX2 ( s2, a2, b2, c2, d2 );
	ex03 EX3 ( s2, a3, b3, c3, d3, e );
	ex04 EX4 ( s4, a4, b4, c4, d4 );

	initial begin
		$display("Modulo de testes guia08");
		a1 = 1; b1 = 1; c1 = 1; d1 = 1;
		$display("Exercicio 01");
		$monitor("a=%b, b=%b, c=%b, d=%b == s=%b", a1, b1, c1, d1, s1);
		#1 a1=0; b1=1; c1=0; d1=1;
		#1 a1=1; b1=0; c1=1; d1=0;
		#1 a1=1; b1=1; c1=1; d1=0;		
		#1 a1=1; b1=1; c1=0; d1=1;
		#1 a1=1; b1=0; c1=1; d1=1;
		#1 a1=0; b1=1; c1=1; d1=1;
		#1 a1=0; b1=0; c1=0; d1=0;

		$display("");				
		$display("Exercicio 02");
		#1 a2=1; b2=1; c2=1; d2=1;
		$monitor("a=%b, b=%b, c=%b, d=%b == s=%b", a2, b2, c2, d2, s2);
		#1 a2=0; b2=1; c2=0; d2=1;
		#1 a2=1; b2=0; c2=1; d2=0;
		#1 a2=1; b2=1; c2=1; d2=0;		
		#1 a2=1; b2=1; c2=0; d2=1;
		#1 a2=1; b2=0; c2=1; d2=1;
		#1 a2=0; b2=1; c2=1; d2=1;
		#1 a2=0; b2=0; c2=0; d2=0;		
		
		$display("");
		$display("Exercicio 03");
		#1 a3=1; b3=1; c3=1; d3=1; e = 0;
		$monitor("a=%b, b=%b, c=%b, d=%b, e=%b == s=%b", a3, b3, c3, d3, e, s3);		
		#1 a1=0; b1=1; c1=0; d1=1; e = 1;
		#1 a1=1; b1=0; c1=1; d1=0; e = 0;
		#1 a1=1; b1=1; c1=1; d1=0; e = 1;
		#1 a1=1; b1=1; c1=0; d1=1; e = 0;
		#1 a1=1; b1=0; c1=1; d1=1; e = 1;
		#1 a1=0; b1=1; c1=1; d1=1; e = 0;
		#1 a1=0; b1=0; c1=0; d1=0; e = 1;
		
		$display("");
		$display("Exercicio 04");
		#1 a4=1; b4=1; c4=1; d4=1;
		$monitor("a=%b, b=%b, c=%b, d=%b == s=%b", a4, b4, c4, d4, s4);		
		#1 a4=0; b4=1; c4=0; d4=1;
		#1 a4=1; b4=0; c4=1; d4=0;
		#1 a4=1; b4=1; c4=1; d4=0;		
		#1 a4=1; b4=1; c4=0; d4=1;
		#1 a4=1; b4=0; c4=1; d4=1;
		#1 a4=0; b4=1; c4=1; d4=1;
		#1 a4=0; b4=0; c4=0; d4=0;
	end
endmodule
