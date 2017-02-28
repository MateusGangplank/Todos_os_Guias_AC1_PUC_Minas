// Exemplo0033 - ALGEBRIC ADDER(6 bits)
// Nome: Jonatas Sena Ferreira
// Matricula: 427424

// -- half adder 2 bits

module halfAdder(output s1, output s0, input a, input b);
	
	//descricao do circuito por portas
	xor x1(s0,a,b);
	and a1(s1,a,b);
endmodule

// -- full adder 2 bits

module fullAdder(output s1, output s0, input a, input b, input carryIn);

	//saidas intermediarias
	wire s2;
	wire s3;
	wire s4;

	//descricao do circuito por portas
	xor x1(s2,a,b);
	xor x2(s0,s2,carryIn);
	and a1(s3,a,b);
	and a2(s4,s2,carryIn);
	or o1(s1,s3,s4);

endmodule


// -- algebric adder 6 bits (1 sinal - 5 amplitude)
module algebricAdder(output [0:5]s, input [0:5]a, input [0:5]b, input key);

	//saidas intermediarias
	wire [0:5]s0;
	wire [0:5]s1;
	
	//selecao de operacao
	xor x1 (s1[5],b[5],key);
	xor x2 (s1[4],b[4],key);
	xor x3 (s1[3],b[3],key);
	xor x4 (s1[2],b[2],key);
	xor x5 (s1[1],b[1],key);
	xor x6 (s1[0],b[0],key);
	
	//descricao do circuito usando modulos anteriores
	fullAdder f0(s0[5],s[5],a[5],s1[5],key);
	fullAdder f1(s0[4],s[4],a[4],s1[4],s0[5]);
	fullAdder f2(s0[3],s[3],a[3],s1[3],s0[4]);
	fullAdder f3(s0[2],s[2],a[2],s1[2],s0[3]);
	fullAdder f4(s0[1],s[1],a[1],s1[1],s0[2]);
	xor x1(s0[0],a[0],s1[0]);
	xor x2(s[0],s0[1],s0[0]);

endmodule

// -- module flag 0
module zeroFlag(output s, input [0:5]i);
	nor (s,i[0],i[1],i[2],i[3],i[4],i[5]);
endmodule

// -- incremento de 1
module increment(output [0:5]s, input [0:5]i);
	//saidas intermediarias
	wire [0:6]u;
	
	not n1(u[6],i[5]);
	xor x1(u[5],i[5],u[6]);
	halfAdder h1 (u[4],s[5],u[5],i[5]);
	halfAdder h2 (u[3],s[4],u[4],i[4]);
	halfAdder h3 (u[2],s[3],u[3],i[3]);
	halfAdder h4 (u[1],s[2],u[2],i[2]);
	halfAdder h5 (u[0],s[1],u[1],i[1]);
	xor x2(s[0],u[0],i[0]);
endmodule 

//------------------
// Test Algebric Adder
//------------------
module testAdder;

// ---- dados locais
//registradores para os operandos
reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
reg key = 1'b0;
wire [0:5]w;
wire [0:5]s;
wire t;

algebricAdder add1(s,a,b,key);
zeroFlag z1(t,s);
increment i1(w,a);
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0033 - Jonatas Sena Ferreira - 427424");
	$display ("Algebric Adder 6 bits (1 sinal - 5 amplitude)\nFlag Zero, Increment\nExercicio03\n\n");
	
	$display("Key 0=Soma/1=Subtracao");
	$display("Op.\ta\tb\ts\tZero\tIncrement(a)");
	#1 $display ("%b: %b + %b = %b\t%b\t%b",key,a,b,s,t,w);
		a = 6'b111110;	b = 6'b000100;
	#1 $display ("%b: %b + %b = %b\t%b\t%b",key,a,b,s,t,w);
		key = 1'b1;
	#1 $display ("%b: %b - %b = %b\t%b\t%b",key,a,b,s,t,w);
		a = 6'b000111;	b = 6'b111000;
	#1 $display ("%b: %b - %b = %b\t%b\t%b",key,a,b,s,t,w);
	
	end
endmodule //testAdder

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0031			24/10/2011		Esboco Algebric Adder 6 bits
 Exemplo0032			24/10/2011		Esboco Algebric Adder 6 bits com zeroFlag
 Exemplo0033			24/10/2011		Esboco Algebric Adder 6 bits com zeroFlag, Increment 1


			Testes e Resultados

 Exemplo0031
		Algebric Adder 6 bits (1 sinal - 5 amplitude)
		
		Key 0=Soma/1=Subtracao
		Op.	a			b			s
		0:	000000 + 000000 = 000000
		0:	111110 + 000100 = 000010
		1:	111110 - 000100 = 111010
		1:	000111 - 111000 = 001111
		
 Exemplo0032
		Algebric Adder 6 bits (1 sinal - 5 amplitude)
		Flag Zero
		
		Key 0=Soma/1=Subtracao
		Op.	a			b			s		Zero
		0:	000000 + 000000 = 000000	1
		0:	111110 + 000100 = 000010	0
		1:	111110 - 000100 = 111010	0
		1:	000111 - 111000 = 001111	0
		
 Exemplo0033
		Algebric Adder 6 bits (1 sinal - 5 amplitude)
		Flag Zero, Increment
		
		Key 0=Soma/1=Subtracao
		Op.	a			b			s		Zero	Increment(a)
		0:	000000 + 000000 = 000000	1		000001
		0:	111110 + 000100 = 000010	0		111111
		1:	111110 - 000100 = 111010	0		111111
		1:	000111 - 111000 = 001111	0		001000
*/