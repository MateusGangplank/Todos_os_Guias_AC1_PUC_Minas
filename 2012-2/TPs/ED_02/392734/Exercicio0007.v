// ---------------------------------------
// Exercicio0007 - Guia 02 - Extras
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------
	
// -------------------------
//  Complemento de 2
// -------------------------

module complemento_de_2;
	reg [7:0] a = 8'b00011010;  //-- 1 byte
	reg [7:0] b;

	initial begin:main
		$display("Exercicio0007 - João Henrique - 392734");
	
		b = a;
		a = ~a + 1; //-- complemento de 1 (+ 1)
			
		$display("Complemento de 2:\n");
		$display("%3b = %b", b, a);
	end //-- main
	
endmodule //-- complemento_de_2