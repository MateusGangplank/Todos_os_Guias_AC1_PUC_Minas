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
      reg [5:0] b; 
      reg [3:0] c; 
      reg [6:0] d; 
		reg [9:0] e;
 
// ------------------------- parte principal 
 initial begin 
      $display("Ex03 - Arturo Jr - 396675"); 
      $display("Operacoes:"); 
 
      a =   6'b100010 + 5'b11010; 
      b =  5'b11010 + 'o23 ;
      c =  'o1234 / 'h2d ; 
      d =  'h1a9 - 9'b101101001 ;
		e =  25 * 'o41 + 'h6b;
       
      $display("\nResultado"); 
      $display("a = %d = %5b", a, a); 
      $display("b = %d = %5b", b, b); 
      $display("c = %d = %3b", c, c); 
      $display("d = %d = %6b", d, d); 
		$display("e = %d = %9b", e, e); 
 end 
 
endmodule // operacao