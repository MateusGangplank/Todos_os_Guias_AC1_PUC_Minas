// ------------------------- 
// Exemplo0016 - BASE 
// Nome: Mateus Augusto Moraes Ferreira
// Matricula: 435669 
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
      $display("Exemplo0016 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test number system"); 
 
      a =  2+14; 
      b =  3*7; 
      c =  34/3; 
      d =  19-11;
		e =  (((2*4)+6)-1); 
       
      $display("\Valores Decimais e Binarios"); 
      $display("a = %d = %b", a, a); 
      $display("b = %d = %b", b, b); 
      $display("c = %d = %5b", c, c); 
		$display("d = %d = %5b", d, d);
		$display("e = %d = %5b", e, e);
  end 
 
endmodule // test_base 
 
 