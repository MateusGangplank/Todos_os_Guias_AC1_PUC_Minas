// ------------------------- 
// Ecercicio2.v - BASE 
// Nome: Felipe Ferreira Andrade do Carmo 
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [6:0] a; 
      reg [4:0] b; 
      reg [1:0] c; 
      reg [5:0] d;
		reg [4:0] e;
 
// ------------------------- parte principal 
 initial begin 
      $display("Exercicio2 - Felipe Ferreira - 427402"); 
      $display("Test number system"); 
 
      a = ~6'b100111+1;
		b = ~6'o54+1;
		c = ~10'd13+1;
		d = ~6'h1B + 1;
		e = 25 + (~36+1);  
     
       
      $display("\nExercicio1"); 
      $display("a = %d = %3b", a, a); 
		$display("b = %d = %3b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %3b", d, d);
		$display("e = %d = %3b", e, e);
      
  end 
 
endmodule // test_base 