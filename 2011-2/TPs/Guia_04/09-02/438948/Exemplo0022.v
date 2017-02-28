// Exemplo0022 - FULL SUBTRACTOR(6 bits)
// Nome: Tiago Moreira
// Matricula: 438948

// -- full subtractor 2 bits

module fullSubtractor(output s1, output s0, input a, input b, input carryIn);

	//saidas intermediarias
	wire s2;
	wire s3;
	wire s4;
	wire s5;
	wire s6;

	//descricao do circuito por portas
	not n1(s5,a);
	not n2(s6,s2);
	xor x1(s2,a,b);
	xor x2(s0,s2,carryIn);
	and a1(s3,s5,b);
	and a2(s4,s6,carryIn);
	or o1(s1,s3,s4);

endmodule

// -- half subtractor 2 bits

module halfSubtractor(output s1, output s0, input a, input b);
	
	//saida intermediaria
	wire s2;
	//descricao do circuito por portas
	not n1(s2,a);
	xor x1(s0,a,b);
	and a1(s1,s2,b);
endmodule

// -- full subtractor 6 bits (1 sinal - 5 amplitude)
module fullSubtractor6(output [0:5]s, input [0:5]a, input [0:5]b);

	//saidas intermediarias
	wire [0:5]s0;

	//descricao do circuito usando modulos anteriores
	halfSubtractor h1(s0[5],s[5],a[5],b[5]);
	fullSubtractor f1(s0[4],s[4],a[4],b[4],s0[5]);
	fullSubtractor f2(s0[3],s[3],a[3],b[3],s0[4]);
	fullSubtractor f3(s0[2],s[2],a[2],b[2],s0[3]);
	fullSubtractor f4(s0[1],s[1],a[1],b[1],s0[2]);
	xor x1(s0[0],b[0],s0[1]);
	xor x2(s[0],a[0],s0[0]);

endmodule

//------------------
// Test Full Subtractor
//------------------
module testAdder;

// ---- dados locais
//registradores para os operandos
reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
wire [0:5]s;

fullSubtractor6 f1(s,a,b);
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0022 - Tiago Moreira - 438948");
	$display ("Full Subtractor 6 bits (1 sinal - 5 amplitude)\nExercicio02\n\n");
	
	#1 $display ("%b - %b = %b",a,b,s);
		a = 6'b111110;	b = 6'b000100;
	#1	$display ("%b - %b = %b",a,b,s);
		b = 6'b111110;
	#1	$display ("%b - %b = %b",a,b,s);
		a = 6'b000111;	b = 6'b111000;
	#1	$display ("%b - %b = %b",a,b,s);
	
	end
endmodule //testSubtractor

/* -- Documentacao complementar
 
 		Historico
 Nome					Data				Modificacao
 Exemplo0021			01/09/2011		Esboco Full Adder 6 bits
 Exemplo0022			01/09/2011		Esboco Full Subtractor 6 bits

			Testes e Resultados

 Exemplo0021
		Full Adder 6 bits (1 sinal - 5 amplitude)
		
		000000 + 000000 = 000000
		111110 + 000100 = 000010
		111110 + 111110 = 111100
		000111 + 111000 = 111111
		
 Exemplo0022
		Full Subtractor 6 bits (1 sinal - 5 amplitude)
		
		000000 - 000000 = 000000
		111110 - 000100 = 111010
		111110 - 111110 = 000000
		000111 - 111000 = 001111

*/