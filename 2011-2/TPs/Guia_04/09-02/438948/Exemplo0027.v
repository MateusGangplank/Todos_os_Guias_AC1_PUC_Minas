// Exemplo0027 - COMPARADOR SELECIONAVEL(6 bits)
// Nome: Tiago Moreira
// Matricula: 438948

// -- equals comparator 2 bits

module equals(output s, input a, input b);

	//descricao do circuito por portas
	xnor xn1(s,a,b);

endmodule

// -- comparador selecionavel(0=igual/1=diferente) 6 bits 
module comparator(output s, input [0:5]a, input [0:5]b, input key);

	//saidas intermediarias
	wire [0:5]s0;
	wire s1;

	//descricao do circuito usando modulos anteriores
	equals e1(s0[5],a[5],b[5]);
	equals e2(s0[4],a[4],b[4]);
	equals e3(s0[3],a[3],b[3]);
	equals e4(s0[2],a[2],b[2]);
	equals e5(s0[1],a[1],b[1]);
	equals e6(s0[0],a[0],b[0]);
	and a1(s1,s0[0],s0[1],s0[2],s0[3],s0[4],s0[5]);
	xor(s1,key);

endmodule


//------------------
// Test Comparator
//------------------
module testComparator;

// ---- dados locais
//registradores para os operandos
reg [0:5]a = 6'b000000;
reg [0:5]b = 6'b000000;
reg key = 1'b0;
wire s;

comparator c1(s,a,b,c);
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0027 - Tiago Moreira - 438948");
	$display ("Comparador selecionavel (0=igual/1=diferente) 6 bits\nExercicio07\n\n");
		
		$display("Operacao a b s")
	#1 $display ("%b: \t%b == %b = %b",c,a,b,s);
		a = 6'b111110;	b = 6'b000100;
	#1 $display ("%b: \t%b == %b = %b",c,a,b,s);
		b = 6'b111110; c = 1'b1;
	#1 $display ("%b: \t%b != %b = %b",c,a,b,s);
		a = 6'b000111;	b = 6'b111000;
	#1 $display ("%b: \t%b != %b = %b",c,a,b,s);
	
	end
endmodule //testComparator

/* -- Documentacao complementar
 
 		Historico
 Nome					Data				Modificacao
 Exemplo0021			01/09/2011		Esboco Full Adder 6 bits
 Exemplo0022			01/09/2011		Esboco Full Subtractor 6 bits
 Exemplo0023			01/09/2011		Esboco Equals Comparator 6 bits
 Exemplo0024			01/09/2011		Esboco Difference Comparator 6 bits
 Exemplo0025			01/09/2011		Esboco Complemento de 2 - 6 bits
 Exemplo0026			01/09/2011		Esboco Comparador selecionavel - 6 bits

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