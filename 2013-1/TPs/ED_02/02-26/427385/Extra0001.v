// -- PUC Minas - Instituto de Ciencias Exatas e Informatica
// -- Ciencia da Computacao - Professor Theldo Cruz
// Nome: ANA CRISTINA PEREIRA TEIXEIRA
// Matricula: 427385

// -- 06.) Definir e testar um módulo para calcular o complemento de 1, de um valor qualquer contido em um byte. 
// -- É recomendável simular o mesmo em Logisim.

// -------------------------
// -- module complement de 1
// -------------------------
module complement (output [7:0] s, input [7:0] p);
	assign s = ~p;
endmodule // complement

// -------------------------
// -- test module complement
// -------------------------
module test_complement;
	// ------------------------- dados locais 
	reg [7:0] a;
	wire [7:0] s1;
	
	// ------------------------- instancia
	complement C1 (s1, a);
	
	// ------------------------- parte principal
	initial begin
		a = 0;
		$display("Extra 0001 - ANA CRISTINA - 427385");
		$display("Teste Complemento de 1, 1 byte = 8 bits");
		
		$monitor("%b = %b", a, s1);
		#1 a = 0;
		#1 a = 1;
		#1 a = 2;
		#1 a = 3;
		#1 a = 4;
		#1 a = 5;
		#1 a = 6;
		#1 a = 7;
		#1 a = 8;
		#1 a = 9;
	end
endmodule

// -- Testes
// Extra 0001 - ANA CRISTINA - 427385
// Teste Complemento de 1, 1 byte = 8 bits
// 00000000 = 11111111
// 00000001 = 11111110
// 00000010 = 11111101
// 00000011 = 11111100
// 00000100 = 11111011
// 00000101 = 11111010
// 00000110 = 11111001
// 00000111 = 11111000
// 00001000 = 11110111
// 00001001 = 11110110