// ----------------------------------------------
// -- Exemplo0026 SOMADOR ALGEBRICO
// -- Alexandre Palmieri Sad
// -- 440265
// ----------------------------------------------

// ----------------------------------------------
// -- MAIOR DE 2 BITS
// ----------------------------------------------
module maior(s, a, b);
	output 	  s;
	input [1:0]a;
	input [1:0]b;
	
	wire x0, x1, x2, x3, x4, x5;
	
	not  N0(x0, b[0]);
	not  N1(x1, b[1]);
	
	and   A(x2, a[0], x0);
	xnor  B(x3, b[1], a[1]);
	and   C(x4, a[1], x1);
	and   D(x5, x2, x3);
	or    E(s, x5, x4);
endmodule

// ----------------------------------------------
// -- MENOR DE 2 BITS
// ----------------------------------------------
module menor(s, a, b);
	output 	  s;
	input [1:0]a;
	input [1:0]b;
	
	wire x0, x1, x2, x3, x4, x5, x6, x7, x8, x9;
	wire n0, n1, n2;
	
	not N0(n0, );
	not N1(n1, );
	not N2(n2, );
	
	xor  A(x0, a[1], a[0]);
	xor  B(x1, a[0], b[0]);
	xor  C(x2, a[1], a[0]);
	and  D(x3, n0, n1);
	and  E(x4, n2, b[1]);
	and  F(x5, b[1], b[0]);
	and  G(x6, x3, x0);
	and  H(x7, x4, x1);
	and  I(x8, x2, x5); 
	or   J(x9, x6, x7);
	or   K(s, x8, x9);
endmodule

// ----------------------------------------------
// -- IGUAL DE 2 BITS
// ----------------------------------------------
module igual(s, a, b);
	output 	  s;
	input [1:0]a;
	input [1:0]b;
	
	wire x0, x1;
	
	xnor A(x0, a[0], b[0]);
	xnor B(x1, a[1], b[1]);
	and  C(s, x0, x1);
endmodule