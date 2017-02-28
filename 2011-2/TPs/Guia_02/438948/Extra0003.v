// Extra0003 - COMPLEMENTO_DE_1 - Entrada de 1 byte
// Nome: Tiago Moreira
// Matricula: 438948

// -- modulo complement

module complement(input [7:0]a, output [7:0]s);
	assign s = ~(a);
endmodule //complement

// -- modulo para testar
module testcomplement;

// ---- dados locais

reg [7:0]a = 8'b11000101;

wire [7:0]s;

complement COMP1(a,s);

// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Extra0003 - Tiago Moreira - 438948");
	$display ("Teste Complemento de 1");
	
	#1 $monitor("C1 de %b = %b",a,s);
	#1	a = 8'b00000000;
	#1 a = 8'b11111111;
	
	end
endmodule //testcomplement

// -- Documentacao complementar
// 
// 		Historico
// Nome					Data				Modificacao
// Extra0003			11/08/2011		Esboco Teste de complemento de 1
//
//			Testes e Resultados
//
// Extra0003
//		Teste Complemento de 1
//		C1 de 11000101 = 00111010
//		C1 de 00000000 = 11111111
//		C1 de 11111111 = 00000000