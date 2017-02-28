// --------------------- 
// Exercicio0004
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [7:0] a; 
      reg [6:0] b; 
      reg [5:0] c; 
      reg [4:0] d;
		reg [7:0] e; 
 
// ------------------------- parte principal 
 initial begin 
       $display("Exercicio0004 - Marcio Enio G Dutra Junior - 441698"); 
       $display("Test number system"); 
 
         a = ~('b101011)+1; 
         b = ~57 +1; 
         c = ~27 +1; 
         d = ~('hc)+1; 
			e = ~('o21)+1;
       
       $display("a = %d = %8b", a, a); 
       $display("b = %d = %7b", b, b); 
       $display("c = %d = %6b", c, c); 
		 $display("d = %d = %5b", d, d); 
		 $display("e = %d = %8b", e, e); 
 end 
 
endmodule // test_base