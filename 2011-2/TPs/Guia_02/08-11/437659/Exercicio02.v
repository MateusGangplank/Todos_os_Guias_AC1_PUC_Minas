// ------------------------- 
// Exercicio02 - Operacoes exercicio 02 
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
      $display("Exercicio02 - Debora Amaral Chaves - 437659"); 
      $display("Operacoes"); 
 
 	// Alternativa a)
      a = 6'b100010;
		b = 5'b11010; 
		
		a = a + b;
		
      $display("100010(2) + 11010(2) = %7b(2)", a); 
	
	// Alternativa b)
	   a = 5'o23;
		b = 5'b11010; 
		
		a = a + b;
		
      $display("11010(2) + 23(8) = %7b(2)", a); 
	
	// Alternativa c)
	   a = 10'o1234 / 6'h2D; //--Conferir resp calc 1110
		
      $display("1234(8)  /  2D(16) = %6b(2)", a);
		
	// Alternativa d)
	   c = 10'h1A9 - 9'b101101001; 
				
      $display("1A9(16) – 101101001(2) = %7b(2)", c);
		
	// Alternativa e)
	   d = 5'd25 * 6'o41 + 7'h6B; 
				
      $display("25 * 41(8) + 6B(16) = %10b(2)", d);

	
   end 
 
endmodule // test_base
    // Exercicio02 - Debora Amaral Chaves - 437659
    // Operacoes
    // 100010(2) + 11010(2) =  111100(2)
    // 11010(2) + 23(8) =  101101(2)
    // 1234(8)  /  2D(16) = 001110(2)
    // 1A9(16) – 101101001(2) = 1000000(2)
    // 25 * 41(8) + 6B(16) = 1110100100(2)