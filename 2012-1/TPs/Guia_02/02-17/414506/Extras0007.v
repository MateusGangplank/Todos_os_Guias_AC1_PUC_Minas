
// ------------------------- 
// Extras7
// Nome: Fernando Silva
// Matricula: 414506
// -------------------------
// -------------------------
//  Complemento de 2
// -------------------------

module complementoDe2;
// ------------------------- definir dados
		reg [0:7] a = 8'b00001011;  //entrada = 1 byte ou 8 bits
		
// ------------------------- parte principal
 initial begin
	$display("Extras7 - Fernando Silva- 414506");
	
	a = ~a + 1; // complemento de 1, + 1;
			
	$display("Complemento de 2:\n");
	$display("a = %3d = %b", a, a);
		
 end
endmodule // test_base