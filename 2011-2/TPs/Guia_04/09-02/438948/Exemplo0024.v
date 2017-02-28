// Exemplo0024 - DIFFERENCE COMPARATOR(6 bits)
// Nome: Tiago Moreira
// Matricula: 438948

// -- difference comparator 2 bits

module different(output s, input a, input b);

	//descricao do circuito por portas
	xor x1(s,a,b);

endmodule

// -- equals comparator 6 bits 
module different6(output s, input [0:5]a, input [0:5]b);

	//saidas intermediarias
	wire [0:5]s0;

	//descricao do circuito usando modulos anteriores
	different e1(s0[5],a[5],b[5]);
	different e2(s0[4],a[4],b[4]);
	different e3(s0[3],a[3],b[3]);
	different e4(s0[2],a[2],b[2]);
	different e5(s0[1],a[1],b[1]);
	different e6(s0[0],a[0],b[0]);
	or o1(s,s0[0],s0[1],s0[2],s0[3],s0[4],s0[5]);

endmodule

//------------------
// Test Difference Comparator
//------------------
module testDifference;

// ---- dados locais
//registradores para os operandos
reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
wire s;

different6 e1(s,a,b);
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0024 - Tiago Moreira - 438948");
	$display ("Difference Comparator 6 bits\nExercicio04\n\n");
	
	#1 $display ("%b != %b = %b",a,b,s);
		a = 6'b111110;	b = 6'b000100;
	#1	$display ("%b != %b = %b",a,b,s);
		b = 6'b111110;
	#1	$display ("%b != %b = %b",a,b,s);
		a = 6'b000111;	b = 6'b111000;
	#1	$display ("%b != %b = %b",a,b,s);
	
	end
endmodule //testDifference

/* -- Documentacao complementar
 
 		Historico
 Nome					Data				Modificacao
 Exemplo0021			01/09/2011		Esboco Full Adder 6 bits
 Exemplo0022			01/09/2011		Esboco Full Subtractor 6 bits
 Exemplo0023			01/09/2011		Esboco Equals Comparator 6 bits
 Exemplo0024			01/09/2011		Esboco Difference Comparator 6 bits

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
*/