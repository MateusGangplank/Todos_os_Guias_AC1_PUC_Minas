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
      reg [4:0] d;
		reg [10:0] e; 
 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0018 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display(""); 
 
      a =  ~6'b100111 + 1 ; 
      b =  ~6'o54 + 1; 
      c =  ~4'd13 + 1  ; 
      d =  ~5'h1B + 1;
		e =  (~(5'd25 - 6'd36))+ 1; 
       
      $display("\Complemento de 2"); 
      $display("a = %d = %b", a, a); 
      $display("b = %d = %b", b, b); 
      $display("c = %d = %5b", c, c); 
		$display("d = %d = %b", d, d);
		$display("e = %d = %b", e, e);
  end 
 
endmodule // test_base 
 
 