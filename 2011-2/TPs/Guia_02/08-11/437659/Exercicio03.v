// ------------------------- 
// Exercicio03 - Complemento de 2 exercicio 03
// Nome: Debora Amaral Chaves 
// Matricula: 437659 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [5:0] a; 
		reg [4:0] b;
		reg [6:0] c;
		reg [9:0] d;
 
// ------------------------- parte principal 
 initial 
 	begin 
      $display("Exercicio03 - Debora Amaral Chaves - 437659"); 
      $display("Complementos de 2"); 
		

 	// Alternativa a)
      a = 6'b100111;
		$display("Complemento de 2 de 100111(2) = %b(2)", ~a+6'b000001); 
		
   // Alternativa b)
      a = 6'o54;	
		$display("Complemento de 2 de 54(8) = %b(2)", ~a+6'b00001);
		
	// Alternativa c) -- Errado
      a = 4'd13;	
		$display("Complemento de 2 de 13(10) = %b(2)", ~a+4'b0001);
		
	// Alternativa d)
      a = 5'h1B;	
		$display("Complemento de 2 de 1B (16) = %b(2)", ~a+5'b0001);

	// Alternativa e)
      a = 25 - 36;	
		$display("Complemento de 2 de  25 - 36(10) = %b(2)", a);

	end 
 
endmodule // test_base

    // Exercicio03 - Debora Amaral Chaves - 437659
    // Complementos de 2
    // Complemento de 2 de 100111(2) = 011001(2)
    // Complemento de 2 de 54(8) = 010100(2)
    // Complemento de 2 de 13(10) = 110011(2)
    // Complemento de 2 de 1B (16) = 100101(2)
    // Complemento de 2 de  25 - 36(10) = 110101(2)