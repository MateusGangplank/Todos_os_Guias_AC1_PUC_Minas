// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Extra0004
// Nome: Ana Cristina Pereira Teixeira
// Matricula: 427385

// 07.) Definir e testar um módulo para calcular o complemento de 2,
// de um valor qualquer contido em um byte.
// É recomendável simular o mesmo em Logisim.

// -------------------------
// -- module complement de 1
// -------------------------
module complement_2 (output [7:0] s, input [7:0] p);
	assign s = (~p) + 1;
endmodule // complement

// -------------------------
// -- test module complement
// -------------------------
module test_complement_2;
// ------------------------- dados locais 
	reg [7:0] a;
	wire [7:0] s1;
// ------------------------- instancia 
	complement_2 C2 (s1, a);
// ------------------------- parte principal
	initial begin
		a = 0;
		$display("Extra0004 - Ana Cristina - 427385");
		$display("Teste Complemento de 2, 1 byte = 8 bits");
//		$monitor("%b = %b", a, s);
		$monitor("%b = %b", a, s1);    // CORRIGIDO
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
