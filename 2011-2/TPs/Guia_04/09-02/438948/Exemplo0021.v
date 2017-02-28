// Exemplo0021 - FULL ADDER(6 bits)
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

// -- half adder 2 bits

module halfAdder(output s1, output s0, input a, input b);
	
	//descricao do circuito por portas
	xor x1(s0,a,b);
	and a1(s1,a,b);
endmodule

// -- full adder 6 bits (1 sinal - 5 amplitude)
module fullAdder6(output [0:5]s, input [0:5]a, input [0:5]b);

	//saidas intermediarias
	wire [0:5]s0;

	//descricao do circuito usando modulos anteriores
	halfAdder h1(s0[5],s[5],a[5],b[5]);
	fullAdder f1(s0[4],s[4],a[4],b[4],s0[5]);
	fullAdder f2(s0[3],s[3],a[3],b[3],s0[4]);
	fullAdder f3(s0[2],s[2],a[2],b[2],s0[3]);
	fullAdder f4(s0[1],s[1],a[1],b[1],s0[2]);
	xor x1(s0[0],b[0],s0[1]);
	xor x2(s[0],a[0],s0[0]);

endmodule

//------------------
// Test Full Adder
//------------------
module testAdder;

// ---- dados locais
//registradores para os operandos
reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
wire [0:5]s;

fullAdder6 f1(s,a,b);
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0021 - Tiago Moreira - 438948");
	$display ("Full Adder 6 bits (1 sinal - 5 amplitude)\nExercicio01\n\n");
	
	#1 $display ("%b + %b = %b",a,b,s);
		a = 6'b111110;	b = 6'b000100;
	#1	$display ("%b + %b = %b",a,b,s);
		b = 6'b111110;
	#1	$display ("%b + %b = %b",a,b,s);
		a = 6'b000111;	b = 6'b111000;
	#1	$display ("%b + %b = %b",a,b,s);
	
	end
endmodule //testAdder

/* -- Documentacao complementar
 
 		Historico
 Nome					Data				Modificacao
 Exemplo0021			01/09/2011		Esboco Full Adder 6 bits

			Testes e Resultados

 Exemplo0021
		Full Adder 6 bits (1 sinal - 5 amplitude)
		
		000000 + 000000 = 000000
		111110 + 000100 = 000010
		111110 + 111110 = 111100
		000111 + 111000 = 111111
*/