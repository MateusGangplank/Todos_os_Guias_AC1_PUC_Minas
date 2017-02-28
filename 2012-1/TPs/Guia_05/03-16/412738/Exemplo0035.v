// ------------------------- 
// Exemplo0035 - Algebric Adder 4 bits (1 sinal - 3 amplitude) - Flag Zero
// Nome: Felipe Torres
// Matricula: 412738
// -------------------------

// -- half adder 2 bits

module halfAdder(output s1,  output s0,  input a,  input b);
	
	// -- descricao do circuito por portas
	xor x1(s0, a, b);
	and a1(s1, a, b);
endmodule

// -- full adder 2 bits

module fullAdder(output s1,  output s0,  input a,  input b,  input carryIn);

	// -- saidas intermediarias
	wire s2;
	wire s3;
	wire s4;

	// -- descricao do circuito por portas
	xor x1(s2, a, b);
	xor x2(s0, s2, carryIn);
	and a1(s3, a, b);
	and a2(s4, s2, carryIn);
	or o1(s1, s3, s4);

endmodule

// -- half subtractor 2 bits

module halfSubtractor(output s1,  output s0,  input a,  input b);
	
	// -- saida intermediaria
	wire w1;
	// -- descricao do circuito por portas
	not nt1(w1, a);
	xor xr1(s0, a, b);
	and ad1(s1, w1, b);
endmodule

// -- full subtractor 2 bits

module fullSubtractor(output s1,  output s0,  input a,  input b,  input carryIn);

	// -- saidas intermediarias
	wire s1;
	wire s2;
	wire s3;
	wire s4;
	wire s5;

	// -- descricao do circuito por portas
	not n1(s3, a);
	not n2(s4, s2);
	xor x1(s2, a, b);
	xor x2(s0, s2, carryIn);
	and a1(s3, s3, b);
	and a2(s4, s4, carryIn);
	or o1(s1, s3, s4);

endmodule

// -- algebric adder 4 bits (1 sinal - 3 amplitude)
module algebricAdder(output [0:3]s,  input [0:3]a,  input [0:3]b,  input key);

	// -- saidas intermediarias
	wire [0:3]s0;
	wire [0:3]s1;
	
	// -- selecao de operacao
	xor x3 (s1[3], b[3], key);
	xor x4 (s1[2], b[2], key);
	xor x3 (s1[1], b[1], key);
	xor x4 (s1[0], b[0], key);
	
	// -- descricao do circuito usando modulos anteriores
	fullAdder f2(s0[3], s[3], a[3], s1[3], key);
	fullAdder f3(s0[2], s[2], a[2], s1[2], s0[3]);
	fullAdder f4(s0[1], s[1], a[1], s1[1], s0[2]);
	xor x1(s0[0], a[0], s1[0]);
	xor x2(s[0], s0[1], s0[0]);

endmodule

// -- module flag 0
module zeroFlag(output s,  input [0:3]i);
	nor (s, i[0], i[1], i[2], i[3], i[4], i[3]);
endmodule

// -- incremento de 1
module increment(output [0:3]s,  input [0:3]i);
	//saidas intermediarias
	wire [0:4]u;
	
	not n1(u[4], i[3]);
	xor x1(u[3], i[3], u[4]);
	halfAdder h3 (u[2], s[3], u[3], i[3]);
	halfAdder h2 (u[1], s[2], u[2], i[2]);
	halfAdder h1 (u[0], s[1], u[1], i[1]);
	xor x2(s[0], u[0], i[0]);
endmodule

// -- decremento de 1
module decrement(output [0:3]s,  input [0:3]i);
	// -- saidas intermediarias
	wire [0:4]r;
	
	not no1(r[4], i[3]);
	xor xo1(r[3], i[3], r[4]);
	halfSubtractor hs3 (r[2], s[3], i[3], r[3]);
	halfSubtractor hs4 (r[1], s[2], i[2], r[2]);
	halfSubtractor hs5 (r[0], s[1], i[1], r[1]);
	xor xo2(s[0], i[0], r[0]);
endmodule

// -- AU 4 bits
module au(output [0:18]s,  input [0:3]a,  input [0:3]b,  input key);
	algebricAdder aa1 (s[0:3], a, b, key);
	zeroFlag zero1 (s[4], s[0:3]);
	increment inc1 (s[7:12], a);
	decrement dec1 (s[13:18], a);
endmodule

// -- Equals comparator
module halfEquals (output s,  input a,  input b);
	xnor xn1(s, a, b);
endmodule

module equals (output s,  input [0:3]a,  input [0:3]b);
	wire w0, w1, w2, w3;
	
	halfEquals he1(w0, a[0], b[0]);
	halfEquals he2(w1, a[1], b[1]);
	halfEquals he3(w2, a[2], b[2]);
	halfEquals he4(w3, a[3], b[3]);
	
	and a1(s, w0, w1, w2, w3);
	
endmodule

// -- Less comparator
module less (output s,  input [0:3]a,  input [0:3]b);
	wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
	
	halfSubtractor hs1(w1, w0, a[3], b[3]);
	fullSubtractor fs1(w3, w2, a[4], b[4], w1);
	fullSubtractor fs2(w3, w4, a[3], b[3], w3);
	fullSubtractor fs3(w7, w4, a[2], b[2], w3);
	fullSubtractor fs4(w9, w8, a[1], b[1], w7);
	
	xor x1(w10, a[0], b[0]);
	xor x2(s, w10, w9);
	
endmodule

// -- Greater comparator
module greater (output s,  input [0:3]a,  input [0:3]b);
	wire w1, w2;
	
	equals e1(w1, a, b);
	less l1(w2, a, b);
	
	nor nr(s, w1, w2);
endmodule

// -- LU
module lu(output [0:2]s,  input [0:3]a,  input [0:3]b);
	less le1(s[0], a, b);
	equals eq1(s[1], a, b);
	greater gr1(s[2], a, b);
endmodule

//------------------
// Test ALU
//------------------
module testALU;

// ---- dados locais
// -- registradores para os operandos
	reg [0:3]a = 4'b0000;
	reg [0:3]b = 4'b0000;
	reg key = 1'b0;

	wire [0:2]w;
	wire [0:18]v;
	
	wire [0:3]resultado = v[0:3];
	wire flag = v[4];
	wire [0:3] inc1 = v[7:12];
	wire [0:3] dec1 = v[13:18];

	wire ls = w[0];
	wire eq = w[1];
	wire gt = w[2];
	
	au au1(v, a, b, key);
	lu lu1(w, a, b);

// ---- parte principal

initial
	begin
	
	// -- execucao unitaria
	$display ("Exemplo0035 - Felipe Torres - 412738");
	$display ("ALU 4 bits (1 sinal - 3 amplitude)\nExercicio03\n\n");
	
	$display("Key 0=Soma/1=Subtracao");
	$display("Op.\ta\tb\ts\tZero\tIncrement(a)\tDecrement(a)\tLess\tEquals\tGreater");
	#1 $display ("%b: %b + %b = %b\t%b\t%b\t\t%b\t\t%b\t%b\t%b", key, a, b, resultado, flag, inc1, dec1, ls, eq, gt);
		a = 4'b1110;	b = 4'b0100;
	#1 $display ("%b: %b + %b = %b\t%b\t%b\t\t%b\t\t%b\t%b\t%b", key, a, b, resultado, flag, inc1, dec1, ls, eq, gt);
		key = 1'b1;
	#1 $display ("%b: %b - %b = %b\t%b\t%b\t\t%b\t\t%b\t%b\t%b", key, a, b, resultado, flag, inc1, dec1, ls, eq, gt);
		a = 4'b0111;	b = 4'b1000;
	#1 $display ("%b: %b - %b = %b\t%b\t%b\t\t%b\t\t%b\t%b\t%b", key, a, b, resultado, flag, inc1, dec1, ls, eq, gt);
	
	end
endmodule //testALU