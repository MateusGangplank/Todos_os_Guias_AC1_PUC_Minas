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
      reg [5:0] a; 
      reg [5:0] b; 
      reg [3:0] c; 
      reg [0:0] d;
		reg [9:0] e;
 
// ------------------------- parte principal 
 initial begin 
      $display("Exercicio2 - Felipe Ferreira - 427402"); 
      $display("Test number system"); 
 
      a =  6'b100010 + 5'b11010;
		b = 5'b11010 + 5'o23;
		c = 10'o1234 / 10'h2D;
		d = 10'h1A9 - 10'b101101001;
		e = 10'd25 * 10'o41 + 10'h6B;  
     
       
      $display("\nExercicio1"); 
      $display("a = %d = %3b", a, a); 
		$display("b = %d = %3b", b, b);
		$display("c = %d = %3b", c, c);
		$display("d = %d = %3b", d, d);
		$display("e = %d = %3b", e, e);
      
  end 
 
endmodule // test_base 