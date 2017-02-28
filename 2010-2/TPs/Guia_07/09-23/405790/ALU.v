// ---------------------
// ALU - 4B
// Nome: Bruno Calil Nicoliello Moreira
// Matricula: 405790
// ---------------------

// ---------------------
// -- fulladder
// ---------------------

module halfadder(cout,s,a,b);

	output s,cout;
	input a,b;
	 
	xor(s,a,b);
	and(cout,a,b);
	
endmodule
	

module fulladder(cout, s0, a0, b0, cin);
	output cout, s0;
	input a0, b0, cin;
	wire c0,c1,c2; 
	
	xor xor1(c0, a0, b0);
	and and1(c1, a0, b0);
	
	xor xor2(s0, c0, cin);
	and and2(c2, c0, cin);
	
	or or1(cout, c1, c2);
	
endmodule //fulladder

// ---------------------
// -- adder
// ---------------------

module adder(flags,s,ch,a,b);
	output [4:0] s;
	output [1:0] flags;
	input [3:0] a , b;
	input ch;
	wire c1, c3, c5, c7,c9,x1,x2,x3,x4; 
	
	
	xor xor1(x1,ch,b[0]);
	xor xor2(x2,ch,b[1]);
	xor xor3(x3,ch,b[2]);
	xor xor4(x4,ch,b[3]);
	
	
	fulladder f1(c1, s[0], a[0], x1, ch);
	fulladder f2(c3, s[1], a[1], x2, c1);
	fulladder f3(c5, s[2], a[2], x3, c3);
	fulladder f4(c9, s[3], a[3], x4, c5);
	xor xor5(s[4],c9,ch);
	
	not not1(c7,c5);
	and and1(flags[1], c7, s[4]);
	
	nor nor1 (flags[0], s[4],s[3],s[2],s[1],s[0]);
	
endmodule //adder

// ---------------------
// -- comparador
// ---------------------

module comparador(maior, menor, dif, igual,a,b);

	output maior, menor, dif, igual;
	input [3:0] a , b;
	
	wire a1,a2,a3,a4,a5,a6,a7,a8,a10,a11,a12,a13,a14,a15,o1,o2,o3,o4;
	
	and and1(a1, ~a[0], b[0]);
	and and2(a2, a[0], ~b[0]);
	and and3(a3, ~a[1], b[1]);
	and and4(a4, a[1], ~b[1]);
	and and5(a5, ~a[2], b[2]);
	and and6(a6, a[2], ~b[2]);
	and and7(a7, ~a[3], b[3]);
	and and8(a8, a[3], ~b[3]);
	
	nor nor1(o1,a1,a2);
	nor nor2(o2,a3,a4);
	nor nor3(o3,a5,a6);
	nor nor4(o4,a7,a8);
	
	and and10(a10,a3,o1);
	and and11(a11,a4,o1);
	and and12(a12,a5,o1,o2);
	and and13(a13,a6,o1,o2);
	and and14(a14,a7,o1,o2,o3);
	and and15(a15,a8,o1,o2,o3);
	and and16(igual,o1,o2,o3,o4);
	
	assign dif = ~igual;      // MELHOR USAR PORTAS
	
	or or10(menor,a1,a10,a12,a14); 
	or or11(maior,a2,a11,a13,a15);
	
endmodule //comparador

// ---------------------
// -- Incremento de 1
// ---------------------
module incremento1(s,b);

	input[3:0]b;
	output [4:0]s;
	wire h1, h2, h3;
	
	halfadder halfadder1(h1,s[0],b[0],1);
	halfadder halfadder2(h2,s[1],b[1],h1);
	halfadder halfadder3(h3,s[2],b[2],h2);
	halfadder halfadder4(s[4],s[3],b[3],h3);
	
endmodule

// ---------------------
// -- Complemento de 1
// ---------------------
module complemento1(s,b);

	input [3:0]b;
	output [3:0]s;
	
	not not1(s[0], b[0]);
	not not2(s[1], b[1]);
	not not3(s[2], b[2]);
	not not4(s[3], b[3]);
	
endmodule

// ---------------------
// -- Complemento de 2
// ---------------------
module complemento2(s,b);

	input[3:0]b;
	output [4:0]s;
	wire [3:0]c1;
	
	complemento1 complemento11(c1,b);
	incremento1 incremento11(s,c1);
		
endmodule
	
	
// ---------------------
// -- teste
// ---------------------
module teste;

	wire[4:0] s,c2,i1;
	wire[3:0] c1;
	wire[1:0] f;
	wire maior,menor,dif,igual;
	reg[3:0] a,b;
	reg ch;
	
	adder A1(f,s,ch, a, b);
	comparador compador1(maior, menor, dif, igual,a,b);
	complemento1 compl1(c1,b);
	incremento1 incr1(i1,b);
	complemento2 compl2(c2,b);

	
	
	initial begin
		
		$display("Bruno Calil Nicoliello Moreira - 405790");
      $display("Teste ALU");
		$display("ch  A    B   =  S      M m D I O Z Compl1  Compl2  Incr1");
		$monitor("%b %4b  %4b =  %5b  %b %b %b %b %b %b  %4b   %5b   %5b", ch,a, b, s,  maior,menor,dif,igual,f[1],f[0],c1,c2,i1);
		#1 ch=1; a=0; b=1; 
		#1 ch=0; a=1; b=1; 
		#1 ch=1; a=2; b=1;
		#1 ch=1; a=2; b=0; 
		#1 ch=0; a=3; b=1; 
		#1 ch=1; a=3; b=2;
		#1 ch=1; a=3; b=3; 
		#1 ch=0; a=4; b=1; 
		#1 ch=1; a=4; b=2;
		#1 ch=1; a=4; b=3; 
		#1 ch=0; a=4; b=4; 
		#1 ch=1; a=5; b=1; 
	end
	
endmodule //teste
	