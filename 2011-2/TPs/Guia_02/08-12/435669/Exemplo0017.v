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
      reg [5:0] a; 
      reg [5:0] b; 
      reg [3:0] c; 
      reg [6:0] d;
		reg [9:0] e; 
 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0017 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display(""); 
 
      a =  6'b100010 + 5'b11010; 
      b =  5'b11010 + 6'o23; 
      c =  10'o1234 / 6'h2D   ; 
      d =  9'h1A9 - 9'b101101001;
		e =  ((5'd25 * 6'o41) + 8'h6B); 
       
      $display("\Valores Convertidos"); 
      $display("a = %d = %b", a, a); 
      $display("b = %d = %b", b, b); 
      $display("c = %d = %6b", c, c); 
		$display("d = %d = %b", d, d);
		$display("e = %d = %b", e, e);
  end 
 
endmodule // test_base 
 
 