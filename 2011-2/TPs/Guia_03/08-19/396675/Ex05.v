// ------------------------- 
// Ex05 - BASE 
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
      $display("Ex05 - Arturo - 396675"); 
      a = -5'b10001; 
      b = -'o64 ;
      c =  -14 ; 
      d = - 'h4C;
		e = - ( 28-35 );
       
      $display("\nResultados"); 
      $display("a = %d = %8d", a, a); 
      $display("b = %d = %7o", b, b); 
      $display("c = %d = %6h", c, c); 
      $display("d = %d = %5o", d, d); 
		$display("e = %d = %4h", e, e); 
 end 
 
endmodule // operacao