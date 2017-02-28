// Exemplo0023 - EQUALS COMPARATOR(6 bits)
// Nome: Tiago Moreira
// Matricula: 438948

// -- equals comparator 2 bits

module equals(output s, input a, input b);

	//descricao do circuito por portas
	xnor xn1(s,a,b);

endmodule

// -- equals comparator 6 bits 
module equals6(output s, input [0:5]a, input [0:5]b);

	//saidas intermediarias
	wire [0:5]s0;

	//descricao do circuito usando modulos anteriores
	equals e1(s0[5],a[5],b[5]);
	equals e2(s0[4],a[4],b[4]);
	equals e3(s0[3],a[3],b[3]);
	equals e4(s0[2],a[2],b[2]);
	equals e5(s0[1],a[1],b[1]);
	equals e6(s0[0],a[0],b[0]);
	and a1(s,s0[0],s0[1],s0[2],s0[3],s0[4],s0[5]);

endmodule

//------------------
// Test Equals Comparator
//------------------
module testEquals;

// ---- dados locais
//registradores para os operandos
reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
wire s;

equals6 e1(s,a,b);
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0023 - Tiago Moreira - 438948");
	$display ("Equals Comparator 6 bits\nExercicio03\n\n");
	
	#1 $display ("%b == %b = %b",a,b,s);
		a = 6'b111110;	b = 6'b000100;
	#1	$display ("%b == %b = %b",a,b,s);
		b = 6'b111110;
	#1	$display ("%b == %b = %b",a,b,s);
		a = 6'b000111;	b = 6'b111000;
	#1	$display ("%b == %b = %b",a,b,s);
	
	end
endmodule //testEquals

/* -- Documentacao complementar
 
 		Historico
 Nome					Data				Modificacao
 Exemplo0021			01/09/2011		Esboco Full Adder 6 bits
 Exemplo0022			01/09/2011		Esboco Full Subtractor 6 bits
 Exemplo0023			01/09/2011		Esboco Equals Comparator 6 bits

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
*/