// ------------------------- 
// Exemplo0018 - BASE 
// Nome: Ursula Rosa Monteiro de Castro 
// Matricula: 427468
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [5:0] a; 
      reg [4:0] b; 
      reg [3:0] c; 
      reg [9:0] d;
		 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0018 - Ursula Rosa - 427468"); 
      $display("Test number system"); 
 
	  
	 a = ~6'b100111 +1  ;
	 $display ("complemento de 2: 100111(2) = %6b", a);
	 a = ~6'o54 + 1;
	 $display ("complemento de 2: 54(8) = %6b", a);
	 c =  ~13 + 1;
	 $display ("complemento de 2: 13(10) = %4b", c);	
	 b = ~5'h1B + 1;
	 $display ("complemento de 2: 1B(16) = %5b", b);
	 a = 25 + (~36+1);
	 $display ("complemento de 2: 25 - 36 = %6b", a);
		
		 end 
 
endmodule // test_base 