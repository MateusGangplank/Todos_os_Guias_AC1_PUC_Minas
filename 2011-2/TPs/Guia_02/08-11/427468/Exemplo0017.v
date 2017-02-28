// ------------------------- 
// Exemplo0017 - BASE 
// Nome: Ursula Rosa Monteiro de Castro 
// Matricula: 427468
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [5:0] a; 
      reg [6:0] b; 
      reg [3:0] c; 
      reg [9:0] d;
		 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0017 - Ursula Rosa - 427468"); 
      $display("Test number system"); 
 
	  
	 a = 6'b100010 + 5'b11010;
	 $display ("100010(2)+11010(2)= %d(10) = %6b(2)", a, a);
	 a = 5'b11010 + 5'o23;
	 $display ("11010(2) + 23(8) = %d(10) = %6b(2)", a, a);
	 c = 10'o1234  /  6'h2D;
	 $display ("1234(8)  /  2D(16) = %d(10) = %3b(2)", c, c);	
	 b = 9'h1A9 - 9'b101101001;
	 $display ("1A9(16) – 101101001(2) = %d(10) = %7b(2)", b, b);
	 d = 25 * 7'o41 + 7'h6B;
	 $display ("25 * 41(8) + 6B(16) = %d(10) = %6b(2)", d, d);
		
		 end 
 
endmodule // test_base 