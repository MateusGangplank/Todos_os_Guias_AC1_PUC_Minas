// ------------------------- 
// Exemplo0033 - Algebric Adder 3 bits
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
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


// -- algebric adder 3 bits
module algebricAdder(output [0:2]s,  input [0:2]a,  input [0:2]b,  input key);

	// -- saidas intermediarias
	wire [0:2]s0;
	wire [0:2]s1;
	
	// -- selecao de operacao
	xor x3 (s1[2], b[2], key);
	xor x2 (s1[1], b[1], key);
	xor x1 (s1[0], b[0], key);
	
	// -- descricao do circuito usando modulos anteriores
	fullAdder f3(s0[2], s[2], a[2], s1[2], key);
	fullAdder f4(s0[1], s[1], a[1], s1[1], s0[2]);
	xor x1(s0[0], a[0], s1[0]);
	xor x2(s[0], s0[1], s0[0]);

endmodule

// -- module flag 0
module zeroFlag(output s,  input [0:2]i);
	nor (s, i[0], i[1], i[2]);
endmodule

// -- incremento de 1
module increment(output [0:2]s,  input [0:2]i);
	// -- saidas intermediarias
	wire [0:3]u;
	
	not n1(u[3], i[2]);
	xor x1(u[2], i[2], u[3]);
	halfAdder h2 (u[1], s[2], u[2], i[2]);
	halfAdder h1 (u[0], s[1], u[1], i[1]);
	xor x2(s[0], u[0], i[0]);
endmodule 

//------------------
// Test Algebric Adder
//------------------
module testAdder;

	// ---- dados locais
	//registradores para os operandos
	reg [0:2]a = 3'b000;
	reg [0:2]b = 3'b000;
	reg key = 1'b0;
	wire [0:2]w;
	wire [0:2]s;
	wire t;
	
	algebricAdder add1(s, a, b, key);
	zeroFlag z1(t, s);
	increment i1(w, a);
	// ---- parte principal
	
	initial
		begin
		
		//execucao unitaria
		$display ("Exemplo0033 - João Henrique - 392734");
		$display ("Algebric Adder 3 bits\n\n");
		
		$display("Key 0=Soma/1=Subtracao");
		$display("Op.a\tb\ts\tZero\tIncrement(a)");
		#1 $display ("%b: %b + %b = %b\t%b\t%b", key, a, b, s, t, w);
			a = 3'b110;	b = 3'b100;
		#1 $display ("%b: %b + %b = %b\t%b\t%b", key, a, b, s, t, w);
			key = 1'b1;
		#1 $display ("%b: %b - %b = %b\t%b\t%b", key, a, b, s, t, w);
			a = 3'b111;	b = 3'b100;
		#1 $display ("%b: %b - %b = %b\t%b\t%b", key, a, b, s, t, w);
		
		end
endmodule //testAdder