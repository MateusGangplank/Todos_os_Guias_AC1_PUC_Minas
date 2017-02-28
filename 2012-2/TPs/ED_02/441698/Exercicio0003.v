// --------------------- 
// Exercicio0003
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [5:0] a; 
      reg [4:0] b; 
      reg [4:0] c; 
      reg [5:0] d;
		reg [5:0] e; 
 
// ------------------------- parte principal 
 initial begin 
       $display("Exercicio0003 - Marcio Enio G Dutra Junior - 441698"); 
       $display("Test number system"); 
 
         a = ~('b100110)+1; 
         b = ~('o24)+1; 
         c = ~25 +1; 
         d = ~('h2d)+1; 
			e = ~(27 - 37)+1;
       
       $display("a = %d = %6b", a, a); 
       $display("b = %d = %5b", b, b); 
       $display("c = %d = %5b", c, c); 
		 $display("d = %d = %6b", d, d); 
		 $display("e = %d = %6b", e, e); 
 end 
 
endmodule // test_base