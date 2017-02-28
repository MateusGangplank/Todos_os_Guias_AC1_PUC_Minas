// ------------------------- 
// Ex03 - BASE 
// Nome: Arturo
// Matricula: 396675 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module operacao; 
// ------------------------- definir dados 
      reg [5:0] a; 
      reg [5:0] b; 
      reg [3:0] c; 
      reg [5:0] d; 
		reg [4:0] e;
 
// ------------------------- parte principal 
 initial begin 
      $display("Ex03 - Arturo - 396675"); 
      a =  6'b100111; 
      b =  6'o54 ;
      c =  13 ; 
      d =  5'h1b;
		e =  25 - 36;
       
      $display("\nResultados"); 
      $display("a = %d = %5b", a, ~a); 
      $display("b = %d = %5b", b, ~b); 
      $display("c = %d = %3b", c, ~c); 
      $display("d = %d = %6b", d, ~d); 
		$display("e = %d = %4b", e, ~e); 
 end 
 
endmodule // operacao