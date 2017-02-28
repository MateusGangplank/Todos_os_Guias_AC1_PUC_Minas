// ------------------------- 
// Exercicio01 - Operacoes exercicio 01 
// Nome: Debora Amaral Chaves 
// Matricula: 437659 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [4:0] a; 
      reg [3:0] b;
 
// ------------------------- parte principal 
 initial 
 	begin 
      $display("Exercicio01 - Debora Amaral Chaves - 437659"); 
      $display("Operacoes"); 
 
 	// Alternativa a)
      a =   2 + 14; 
        
      $display("2 + 14 = %5b(2)", a); 
		
	// Alternativa b)
		b =   3 * 7;
		
	   $display("3 * 7 = %4b(2)", b); 
		
	// Alternativa c)
		b =   34 / 3;
		
	   $display("34 / 3 = %4b(2)", b); 

	// Alternativa d)
		b =   19 - 11;
		
	   $display("19 - 11 = %4b(2)", b); 
		
	// Alternativa e)
		b =   2 * 4 + 6 - 1;
		
	   $display("2 * 4 + 6 - 1 = %4b(2)", b); 		
	
   end 
 
endmodule // test_base

    // Exercicio01 - Debora Amaral Chaves - 437659
    // Operacoes
    // 2 + 14 = 10000(2)
    // 3 * 7 = 0101(2)
    // 34 / 3 = 1011(2)
    // 19 - 11 = 1000(2)
    // 2 * 4 + 6 - 1 = 1101(2)