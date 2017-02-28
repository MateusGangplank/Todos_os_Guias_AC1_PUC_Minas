// ---------------------------------------
// Exercicio0006 - Guia 02 - Extras
// Nome: Jo�o Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------
	
// -------------------------
//  Complemento de 1
// -------------------------

module complemento_de_1;
	reg [7:0] a = 8'b00000000;  //-- 1 byte
	reg [7:0] b;

	initial begin:main
		$display("Exercicio0006 - Jo�o Henrique - 392734");
	
		b = a;
		a = ~a;
			
		$display("Complemento de 1:\n");
		$display("%3b = %b", b, a);
	end //-- main
	
endmodule //-- complemento_de_1