// -------------------------
// Exemplo0011 - BASE
// Nome: Afonso Spinelli
// Matricula: 266304
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [2:0] a; 
      reg [3:0] b; 
      reg [4:0] c; 
      reg [4:0] d; 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0011 - Afonso Spinelli - 266304");
      $display("Test number system"); 
 
      a =   5; 
      b =  10; 
      c =  15; 
      d =  20; 
       
      $display("\nPositive value"); 
      $display("a = %d = %3b", a, a); 
      $display("b = %d = %4b", a, a); 
      $display("c = %d = %5b", a, a); 
 
      $display("b = %d = %4b", b, b); 
      $display("c = %d = %5b", c, c); 
      $display("d = %d = %5b", d, d); 
      $display("d = %d = %5o", d, d); 
      $display("d = %d = %5h", d, d);

 end
    
      /*
      Exemplo0011 - Afonso Spinelli - 266304
      Test number system
      Positive value
      a = 5 = 101
      b = 5 =  101
      c = 5 =   101
      b = 10 = 1010
      c = 15 = 01111
      d = 20 = 10100
      d = 20 =    24
      d = 20 =    14 
      > Execution finished.
      */

endmodule // test_base