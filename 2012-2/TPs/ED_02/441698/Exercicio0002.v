// --------------------- 
// Exercicio0002
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [6:0] a; 
      reg [5:0] b; 
      reg [9:0] c; 
      reg [8:0] d;
		reg [9:0] e; 
 
// ------------------------- parte principal 
 initial begin 
       $display("Exercicio0002 - Marcio Enio G Dutra Junior - 441698"); 
       $display("Test number system"); 
 
         a = 6'b101010 + 5'b11011; 
         b = 5'b11011 + 'o25; 
         c = 'o1234 / 'h3c; 
         d = 'h1ba - 9'b1_0111_0001; 
			e = ('o25 * 'o32) + 'h7a;
       
       $display("a = %d = %7b", a, a); 
       $display("b = %d = %6b", b, b); 
       $display("c = %d = %4b", c, c); 
		 $display("d = %d = %7b", d, d); 
		 $display("e = %d = %10b", e, e); 
 end 
 
endmodule // test_base