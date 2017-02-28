// ------------------------- 
// Extra07 - Complemento de 2 extra 07
// Nome: Debora Amaral Chaves 
// Matricula: 437659 
// ------------------------- 
module complementoDeDois(output [7:0]s, input [7:0]p);
	assign s = ~p+1; //complemento de 2
endmodule 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [7:0] a; 
		wire [7:0] s;
		
		complementoDeDois c2(s,a); 
		
 initial
	begin
		a = 6'b100111;
	end
		
// ------------------------- parte principal 
 initial 
 	begin 
      $display("Extra07 - Debora Amaral Chaves - 437659"); 
      $display("Complementos de 2 "); 
		
 	// Testes
	#1 $display("Complemento de 2 de %b(2) = %b(2)", a, s); 
	
	#1 a = 6'b110101;
	   $display("Complemento de 2 de %b(2) = %b(2)", a, s); 
	
	#1 a = 6'b010100;
	   $display("Complemento de 2 de %b(2) = %b(2)", a, s); 


	end 
	
endmodule // test_base
    // Extra07 - Debora Amaral Chaves - 437659
    // Complementos de 2 
    // Complemento de 2 de 00100111(2) = 11011001(2)
    // Complemento de 2 de 00110101(2) = 11011001(2)
    // Complemento de 2 de 00010100(2) = 11001011(2) -- Deu errado