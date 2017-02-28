// ------------------------- 
// Guia 02
// -------------------------
// ------------------------- 
// Extras 0007
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------
// -------------------------
//  Complemento de 2
// -------------------------

module complementoDe2;
// ------------------------- definir dados
		reg [0:7] a = 8'b00001011;  //entrada = 1 byte ou 8 bits
		
// ------------------------- parte principal
 initial begin
	$display("Extras0007 - João Henrique Mendes de Oliveira - 392734");
	
	a = ~a + 1; // complemento de 1, + 1;
			
	$display("Complemento de 2:\n");
	$display("a = %3d = %b", a, a);
		
 end
endmodule // test_base