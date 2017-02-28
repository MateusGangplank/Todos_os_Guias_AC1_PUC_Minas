// --------------------- 
// Exercicio0001
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [4:0] a; 
      reg [4:0] b; 
      reg [5:0] c; 
      reg [4:0] d;
		reg [4:0] e; 
 
// ------------------------- parte principal 
 initial begin 
       $display("Exercicio0001 - Marcio Enio G Dutra Junior - 441698"); 
       $display("Test number system"); 
 
         a = 2 + 14; 
         b = 3 * 9; 
         c = 32 / 5; 
         d = 24 - 11; 
			e = 2 * 6 + 7 - 1;
       
       $display("a = %d = %5b", a, a); 
       $display("b = %d = %5b", b, b); 
       $display("c = %d = %3b", c, c); 
		 $display("d = %d = %4b", d, d); 
		 $display("e = %d = %5b", e, e); 
 end 
 
endmodule // test_base