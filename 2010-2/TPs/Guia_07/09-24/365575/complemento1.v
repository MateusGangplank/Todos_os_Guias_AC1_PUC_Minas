// ---------------------
//// Nome: Luciana Cristina Silva
// Matricula: 365575
//	--------------------

module complemento1 ( s3,s2,s1,s0,  a3,a2,a1,a0 );
	output s4,s3,s2,s1,s0;
	input a3,a2,a1,a0;
	
	not NOT1 ( s0,a0 );
	not NOT2 ( s1,a1 );
	not NOT3 ( s2,a2 );
	not NOT4 ( s3,a3 );
	
endmodule//complemento1

  
  
  

module testeguia07;
	reg a3,a2,a1,a0,  b3,b2,b1,b0;
	wire w1,w2,w3,w4,w5,w6,w7,w8,w9;
	
	complemento1 COMP1 ( w1,w2,w3,w4, 	a3,a2,a1,a0 );
	complemento1 COMP2 ( w5,w6,w7,w8,	b3,b2,b1,b0 );
	
initial begin:start
end





initial begin:main
	$display ("Guia07 - Programa1");
	$display ("InclusAo na ALU de 4 bits a operaCAo de complemento de 1\n");
	$display ("Aluno: Luciana Cristina Silva		Matricula:365575\n");
	#1	a3=0;a2=0;a1=0;a0=0;  b3=0;b2=0;b1=0;b0=0;
	$monitor ("A[%b | %b %b %b] => Ac[%b | %b %b %b] 		B[%b | %b %b %b] => Bc[%b | %b %b %b]", a3,a2,a1,a0,		 w1,w2,w3,w4,		b3,b2,b1,b0,			w5,w6,w7,w8);
	#1 a0 = 1;
	#1 b0 = 1;
	#1 a0 = 0; a1 = 1; b2 = 1;
	#1 a2=1; a3=1; a1=0; b2=0; b1=1; b0=1;
	
end
endmodule

