// ------------------------- 
// Ex04 - BASE 
// Nome: Arturo
// Matricula: 396675
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module operacao; 
// ------------------------- definir dados 
      reg [8:0] a; 
      reg [7:0] b; 
      reg [6:0] c; 
      reg [5:0] d; 
		reg [4:0] e;
 
// ------------------------- parte principal 
 initial begin 
      $display("Ex04 - Arturo - 396675"); 
      a = -6'b110101; 
      b = -'o51 ;
      c =  -13 ; 
      d = - 'h3b;
		e = - ( 19-25 );
       
      $display("\nResultados"); 
      $display("a = %d = %8b", a, a); 
      $display("b = %d = %7b", b, b); 
      $display("c = %d = %6b", c, c); 
      $display("d = %d = %5b", d, d); 
		$display("e = %d = %4b", e, e); 
 end 
 
endmodule // operacao