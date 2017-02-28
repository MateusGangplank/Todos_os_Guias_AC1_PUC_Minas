// ---------------------
// AC1 - 15/09/2010
//	Guia 06 - v 0.1
//
// Nome: Gustavo Guimarães
// Matricula: 405804
// ---------------------


//--------------------------------
//-- FULL ADDER
//---------------------------------

module fulladder(cout, s0, a0, b0, cin);

	output cout, s0;
	input  a0, b0, cin;
	
	wire   c0,c1,c2; 
	
		//INSTANCIA
	xor XOR1(c0, a0, b0);
	and AND1(c1, a0, b0);
	
	xor XOR2(s0, c0, cin);
	and AND2(c2, c0, cin);
	
	or  OR1 (cout, c1, c2);
	
endmodule

//----------------------------------------------
//--Comparadores Maior, Menor, Igual e Diferente
//----------------------------------------------

module comparadores ( maior, menor, igual, dif, a, b );

	output maior, menor, igual, dif;
	input [3:0] a, b;
	
	wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18;
	
		//INSTANCIA
	and AND1 ( s1, ~a[3], b[3] );
	and AND2 ( s2, a[3], ~b[3] );
	and AND3 ( s3, ~a[2], b[2] ); 
	and AND4 ( s4, a[2], ~b[2] );
	and AND5 ( s5, ~a[1], b[1] ); 
	and AND6 ( s6, a[1], ~b[1] );
	and AND7 ( s7, ~a[0], b[0] );
	and AND8 ( s8, a[0], ~b[0] );
	nor NOR1 ( s9,  s1, s2 );
	nor NOR2	( s10, s3, s4 );
	nor NOR3	( s11, s5, s6 );
	nor NOR4	( s12, s7, s8 );
	and AND9 ( s13, s9, s3 );
	and AND10( s14, s9, s4 );
	and AND11( s15, s9, s10, s5 );
	and AND12( s16, s9, s10, s6 );
	and AND13( s17, s9, s10, s11, s7 );
	and AND14( s18, s9, s10, s11, s8 );
	and AND15( igual, s9, s10, s11, s12);
	assign dif = ~igual;
	or  OR1  ( menor, s1, s13, s15, s17 );
	or  OR2  ( maior, s2, s14, s16, s18 );
	
	
endmodule

//-------------------------------
//-- ALU com Overflow e Zero
//-------------------------------

module adder(flags,s,op,a,b);

	output [4:0] s;
	output [1:0] flags;
	input  [3:0] a, b;
	input  op;
	
	wire c1, c2, c3, c4, aux1, aux2, aux3, aux4, aux5; 
	
		//INSTANCIA
	xor		 XOR1 ( aux1, b[0], op );
	xor		 XOR2 ( aux2, b[1], op );
	xor		 XOR3 ( aux3, b[2], op );
	xor		 XOR4 ( aux4, b[3], op );
	fulladder F1   (c1, s[0], a[0], aux1, op);
	fulladder F2   (c2, s[1], a[1], aux2, c1);
	fulladder F3   (c3, s[2], a[2], aux3, c2);
	fulladder F4   (c4, s[3], a[3], aux4, c3);
	xor		 XOR5 (s[4], op, c4 );
	not       NOT1 (aux5,c3);
	and       AND1 (flags[1], s[4], aux5);
	nor       NOR1 (flags[0], s[4], s[3], s[2], s[1], s[0]);
	
endmodule

//--------------------------
//-- Modulo Teste
//---------------------------

module teste;

	wire[4:0] s;
	wire[1:0] f;
	wire      M, m, I, D;
	reg [3:0] a,b; 
	reg       op;
	
	adder        A1 (f,s, op, a, b);
	comparadores C1 (M, m, I, D, a, b ); 
	
	initial begin
		op=0; a=0; b=0;
	
		$display ("Guia 06 - Gustavo Guimaraes - 405804");
		$display ("\nTeste ALU e Comparadores\n");
		$display ("Op   A     B  =   S    M m I D OVR Z" );
		$monitor("%b  %4b  %4b = %5b  %b %b %b %b  %b  %b",op,a,b,s,M,m,I,D,f[1],f[0]);
	#1 op=0; a=0; b=1;
	#1 op=1; a=1; b=1;
	#1 op=0; a=2; b=1;
	#1 op=0; a=8; b=8;
	#1 op=1; a=6; b=5;
	#1 op=0; a=4; b=5;
	#1 op=0; a=-8;b=-8;
	
	end
endmodule
	