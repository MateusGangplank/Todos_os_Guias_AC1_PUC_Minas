
// Nome: Felipe Augusto
// Mat.: 415517


// HALF-ADDER
		module ha ( s0, s1, x, y );
		
			output s0, s1;
			input  x, y;
		
						// Main
			or  OR1  ( s3, x, y );
			and AND1 ( s1, x, y );
			not NOT1 ( s2, s1 );
			and AND2 ( s0, s2, s3 );
		
		endmodule


// FULL ADDER

module fulladder(cout, s0, a0, b0, cin);

	output cout, s0;
	input  a0, b0, cin;
	
	wire   c0,c1,c2; 
	
		// Main
	xor XOR1(c0, a0, b0);
	and AND1(c1, a0, b0);
	
	xor XOR2(s0, c0, cin);
	and AND2(c2, c0, cin);
	
	or  OR1 (cout, c1, c2);
	
endmodule

// Complemento de 1

	module compl1B ( c1, b );
		input  [3:0] b;
		output [3:0] c1;
		
		not NOT1 ( c1[0], b[0] );
		not NOT2 ( c1[1], b[1] );
		not NOT3 ( c1[2], b[2] );
		not NOT4 ( c1[3], b[3] );

	endmodule
	
// Incremento de 1

	module inc1B ( i1, b );
		input  [3:0] b;
		output [3:0] i1;
		wire   c0,c1,c2,c3;
		
		ha HA1 ( i1[0], c0, 1, b[0] );
		ha HA2 ( i1[1], c1, c0,b[1] );
		ha HA3 ( i1[2], c2, c1,b[2] );
		ha HA4 ( i1[3], c3, c2,b[3] );
	endmodule
	

// Complemento de 2

	module compl2B ( c2, c1 );
		input  [3:0] c1;
		output [3:0] c2;
		
		inc1B INC1 ( c2, c1 );   
	endmodule
	
//Comparadores Maior, Menor, Igual e Diferente

module comparadores ( maior, menor, igual, dif, a, b );

	output maior, menor, igual, dif;
	input [3:0] a, b;
	
	wire s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18;
	
	// Main
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


// ALU com Overflow e Zero

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


// Modulo Teste

module teste;

	wire[4:0] s;
	wire[1:0] f;
	wire[3:0] c1;
	wire[3:0] c2;
	wire[3:0] i1;
	wire      M, m, I, D;
	reg [3:0] a,b; 
	reg       op;
	
	adder        A1 (f,s, op, a, b);
	comparadores C1 (M, m, I, D, a, b); 
	compl1B		 B1 (c1, b);
	inc1B			 I1 (i1, b);
	compl2B      B2 (c2, c1);
	
	initial begin
		op=0; a=0; b=0;
	
		$display ("Guia 07 - Felipe Augusto - 415517");
		$display ("\nTeste ALU, Comparadores e Complementos\n");
		$display ("Op   A     B  =   S    M m I D OVR Z   Compl1B   Compl2B   Inc1B" );
		$monitor("%b  %4b  %4b = %5b  %b %b %b %b  %b  %b    %4b      %4b      %4b",op,a,b,s,M,m,I,D,f[1],f[0],c1,c2,i1);
	#1 op=0; a=0; b=1;
	#1 op=1; a=1; b=1;
	#1 op=0; a=2; b=1;
	#1 op=0; a=8; b=8;
	#1 op=1; a=6; b=5;
	#1 op=0; a=4; b=5;
	#1 op=0; a=-8;b=-8;
	
	end
endmodule
	