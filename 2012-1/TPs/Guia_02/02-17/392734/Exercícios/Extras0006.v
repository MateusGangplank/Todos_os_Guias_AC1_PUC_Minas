// ------------------------- 
// Guia 02
// -------------------------
// ------------------------- 
// Extras 0006
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------

// -------------------------
//  Complemento de 1
// -------------------------

module complementoDe1;
// ------------------------- definir dados
		reg [0:7] a = 00000000;  //entrada = 1 byte ou 8 bits
		
// ------------------------- parte principal
 initial begin
	$display("Extras0006 - João Henrique Mendes de Oliveira - 392734");
	
	a = ~a; // negação ou o inverso do mesmo;
			
	$display("Complemento de 1:\n");
	$display("a = %3d = %b", a, a);
		
 end
endmodule //complementoDe1