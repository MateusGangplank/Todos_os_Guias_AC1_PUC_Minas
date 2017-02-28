// ------------------------- 
// Exercicio1.v - BASE 
// Nome: Felipe Ferreira Andrade do Carmo 
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [4:0] a; 
      reg [4:0] b; 
      reg [3:0] c; 
      reg [3:0] d;
		reg [3:0] e;
 
// ------------------------- parte principal 
 initial begin 
      $display("Exercicio1 - Felipe Ferreira - 427402"); 
      $display("Test number system"); 
 
      a =  2+14;
		b = 3*7;
		c = 34/3;
		d = 19-11;
		e = ~0+2*4+6;  
     
       
      $display("\nExercicio1"); 
      $display("a = %d = %3b", a, a); 
		$display("b = %d = %3b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %3b", d, d);
		$display("e = %d = %3b", e, e);
      
  end 
 
endmodule // test_base 