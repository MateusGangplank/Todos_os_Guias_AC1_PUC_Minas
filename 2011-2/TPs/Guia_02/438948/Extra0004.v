// Extra0004 - COMPLEMENTO_DE_2 - Entrada de 1 byte
// Nome: Tiago Moreira
// Matricula: 438948

// -- modulo complement

module complement(input [7:0]a, output [7:0]s);
	assign s = ~(a)+1;
endmodule //complement

// -- modulo para testar
module testcomplement;

// ---- dados locais

reg [7:0]a = 8'b11000101;

wire [7:0]s;

complement COMP2(a,s);

// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Extra0004 - Tiago Moreira - 438948");
	$display ("Teste Complemento de 2");
	
	#1 $monitor("C2 de %b = %b",a,s);
	#1	a = 8'b00000000;
	#1 a = 8'b11111111;
	
	end
endmodule //testcomplement

// -- Documentacao complementar
// 
// 		Historico
// Nome					Data				Modificacao
// Extra0003			11/08/2011		Esboco Teste de complemento de 1
// Extra0004			11/08/2011		Esboco Teste de complemento de 2
//
//			Testes e Resultados
//
// Extra0003
//		Teste Complemento de 1
//		C1 de 11000101 = 00111010
//		C1 de 00000000 = 11111111
//		C1 de 11111111 = 00000000
//
// Extra0004
//		Teste Complemento de 2
//		C2 de 11000101 = 00111011
//		C2 de 00000000 = 00000000
//		C2 de 11111111 = 00000001