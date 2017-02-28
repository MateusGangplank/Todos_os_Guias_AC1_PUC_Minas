// ------------------------- 
// Exemplo0016 - BASE 
// Nome: Felipe Pacifico 
// Matricula: 389868
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
      $display("Exemplo0016 - Felipe Pacifico - 389868"); 
      $display("Test number system"); 
 
 		
   	c = 2+14;
		$display("2 + 14 = %d = %5b", c, c); 
		d = 3 * 7;
		$display("3 * 7 = %d = %5b", d, d);
		b = 34 / 3;
		$display("34 / 3 = %d = %4b", b, b);
		b = 19-11;
		$display("19 - 11 = %d = %4b", b, b);
		b = 2 * 4 + 6 - 1;
		$display("2 * 4 + 6 - 1 = %d = %4b", b, b);
		
 end 
 
endmodule // test_base