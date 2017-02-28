// ------------------------- 
// Exemplo0016 - BASE 
// Nome: Patrick Flávio Teixeira Coura 
// Matricula: 427450 
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
      $display("Exemplo0016 - Patrick Flávio Teixeira Coura - 427450"); 
      $display("Test number system"); 
	
		// a.) 100111(2)  
		// b.) 54(8) 
		// c.) 13(10) 
		// d.) 1B(16) 
		// e.) 25 - 36 
		
		
   	a = ~6'b100111+1;
		$display("Complemento de 2: 100111(2) = %6b(2)", a); 
		
		a = ~6'o54 + 1;
		$display("Complemento de 2: 54(8) = %6b(2)", a);
		
		c = ~13 + 1;
		$display("Complemento de 2: 13(10) = %4b(2)", c);
		
		b = ~5'h1B+1;
		$display("Complemento de 2: 1B(16) = %5b(2)", b);
		
		a = 25 + (~36+1);
		$display("Complemento de 2: 25 - 36 = %6b(2)", a);
		
 end 
 
endmodule // test_base