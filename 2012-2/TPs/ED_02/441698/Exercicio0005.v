// --------------------- 
// Exercicio0005
// Nome: Marcio Enio G Dutra Junior 
// Matricula: 441698 
// --------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [7:0] a; 
      reg [7:0] b; 
      reg [7:0] c; 
      reg [7:0] d;
		reg [7:0] e; 
 
// ------------------------- parte principal 
 initial begin 
       $display("Exercicio0005 - Marcio Enio G Dutra Junior - 441698"); 
       $display("Test number system"); 
 
         a = ('b101010 + ~('b1001)+1); 
         b = ('b11011 + ~('o15)+1);
         c = ('o34 + ~('hc)+1);
         d = ('hda + ~('b10111001)+1); 
			e = (27 + ~('h1b)+1);
       
       $display("a = %d = %8b", a, a); 
       $display("b = %d = %8b", b, b); 
       $display("c = %d = %8b", c, c); 
		 $display("d = %d = %8b", d, d); 
		 $display("e = %d = %8b", e, e); 
 end 
 
endmodule // test_base