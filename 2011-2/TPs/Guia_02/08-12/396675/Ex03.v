// ------------------------- 
// Ex03 - BASE 
// Nome: Arturo Jr 
// Matricula: 396675 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module operacao; 
// ------------------------- definir dados 
      reg [5:0] a; 
      reg [4:0] b; 
      reg [3:0] c; 
      reg [9:0] d; 
		reg [9:0] e;
 
// ------------------------- parte principal 
 initial begin 
      $display("Ex03 - Arturo Jr - 396675"); 
      $display("Operacoes:"); 
 
      a =  ~6'b10011 + 1; 
      b =  ~6'o54 + 1 ;
      c =  ~13 + 1 ; 
      d =  ~5'h1b + 1 ;
		e =  25 + ( ~36 + 1 );
       
      $display("\nResultado"); 
      $display("a = %d = %6b", a, a); 
      $display("b = %d = %6b", b, b); 
      $display("c = %d = %4b", c, c); 
      $display("d = %d = %5b", d, d); 
		$display("e = %d = %6b", e, e); 
 end 
 
endmodule // operacao