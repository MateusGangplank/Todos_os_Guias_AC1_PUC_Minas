// Exemplo0032 - ALGEBRIC ADDER(6 bits)
// Nome: Tiago Moreira
// Matricula: 438948

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

//------------------
// Test Algebric Adder
//------------------
module testAdder;

// ---- dados locais
//registradores para os operandos
reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
reg key = 1'b0;
wire [0:5]s;
wire t;

algebricAdder add1(s,a,b,key);
zeroFlag z1(t,s);
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0032 - Tiago Moreira - 438948");
	$display ("Algebric Adder 6 bits (1 sinal - 5 amplitude)\nFlag Zero\nExercicio02\n\n");
	
	$display("Key 0=Soma/1=Subtracao");
	$display("Op.\ta\tb\ts\tZero");
	#1 $display ("%b: %b + %b = %b\t%b",key,a,b,s,t);
		a = 6'b111110;	b = 6'b000100;
	#1 $display ("%b: %b + %b = %b\t%b",key,a,b,s,t);
		key = 1'b1;
	#1 $display ("%b: %b - %b = %b\t%b",key,a,b,s,t);
		a = 6'b000111;	b = 6'b111000;
	#1 $display ("%b: %b - %b = %b\t%b",key,a,b,s,t);
	
	end
endmodule //testAdder

/* -- Documentacao complementar
 
 		Historico
 Nome						Data				Modificacao
 Exemplo0031			11/09/2011		Esboco Algebric Adder 6 bits
 Exemplo0032			11/09/2011		Esboco Algebric Adder 6 bits com zeroFlag


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
*/