// Exemplo0025 - COMPLEMENTO DE 2(6 bits)
// Nome: Tiago Moreira
// Matricula: 438948

// -- complemento de 1 - 1 bit

module complement1(output s, input a);

	//descricao do circuito por portas
	not n1(s,a);

endmodule

// -- hal adder 2 bits, para calcular o complemento de 2
module halfAdder(output s1, output s0, input a, input b);
	
	//descricao do circuito por portas
	xor x1(s0,a,b);
	and a1(s1,a,b);
endmodule

// -- complemento de 2 - 6 bits 
module complement2(output [0:5]s, input [0:5]a);

	//saidas intermediarias
	wire [0:5]s0;
	wire [0:6]s1;

	//descricao do circuito usando modulos anteriores
	complement1 c1(s0[5],a[5]);
	complement1 c2(s0[4],a[4]);
	complement1 c3(s0[3],a[3]);
	complement1 c4(s0[2],a[2]);
	complement1 c5(s0[1],a[1]);
	complement1 c6(s0[0],a[0]);
	
	not no1(s1[6],a[5]);
	xor xo1(s1[5],a[5],s1[6]);
	
	halfAdder h1(s1[4],s[5],s0[5],s1[5]);
	halfAdder h2(s1[3],s[4],s0[4],s1[4]);
	halfAdder h3(s1[2],s[3],s0[3],s1[3]);
	halfAdder h4(s1[1],s[2],s0[2],s1[2]);
	halfAdder h5(s1[0],s[1],s0[1],s1[1]);
	xor xo2(s[0],s0[0],s1[0]);

endmodule

//------------------
// Test Complemento de 2
//------------------
module testComplement2;

// ---- dados locais
//registradores para os operandos
reg [0:5]a = 6'b000000;
wire [0:5]s;

complement2 c1(s,a);
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0025 - Tiago Moreira - 438948");
	$display ("Complemento de 2 - 6 bits\nExercicio05\n\n");
	
	#1 $display ("C2(%b) = %b",a,s);
		a = 6'b111111;
	#1 $display ("C2(%b) = %b",a,s);
		a = 6'b110110;
	#1 $display ("C2(%b) = %b",a,s);
		a = 6'b010110;
	#1 $display ("C2(%b) = %b",a,s);
	
	end
endmodule //testComplement2

/* -- Documentacao complementar
 
 		Historico
 Nome					Data				Modificacao
 Exemplo0021			01/09/2011		Esboco Full Adder 6 bits
 Exemplo0022			01/09/2011		Esboco Full Subtractor 6 bits
 Exemplo0023			01/09/2011		Esboco Equals Comparator 6 bits
 Exemplo0024			01/09/2011		Esboco Difference Comparator 6 bits
 Exemplo0025			01/09/2011		Esboco Complemento de 2 - 6 bits

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

 Exemplo0023
		Equals Comparator 6 bits
		
		000000 == 000000 = 1
		111110 == 000100 = 0
		111110 == 111110 = 1
		000111 == 111000 = 0
		
 Exemplo0024
		Difference Comparator 6 bits
		
		000000 != 000000 = 0
		111110 != 000100 = 1
		111110 != 111110 = 0
		000111 != 111000 = 1
		
 Exemplo0025
		Complemento de 2 - 6 bits
		
		C2(000000) = 000000 - overflow
		C2(111111) = 000001
		C2(110110) = 001010
		C2(010110) = 101010
*/