// ------------------------- 
// Exemplo0018 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [5:0] a;
      reg [5:0] b;
      reg [4:0] c;
      reg [4:0] d;
      reg [5:0] e;
      reg [5:0] f;
      reg [4:0] g;
		
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0018 - Lucas Cardoso - 441694");  
 
      a = 'b100111;
      b = ~a + 1'b1; 
       
      $display("\n%d = %b", a, a); 
      $display("C(2) de 39 = %d = %b", b, b); 
		
		c = 'o23;
      d = ~c + 1'b1;
		
		$display("\n%d = %b", c, c);
		$display("C(2) de 19 = %d = %b", d, d);
		
		c = 'd23;
      d = ~c + 1'b1;
		
		$display("\n%d = %b", c, c);
		$display("C(2) de 23 = %d = %b", d, d);
		
		a = 'h2B;
      b = ~a + 1'b1;
		
		$display("\n%d = %b", a, a);
		$display("C(2) de 43 = %d = %b", b, b);
		
		e = 26;
      f = 36;
      g = e + (~f + 1'b1);

		$display("\n%d = %b", e, e);
		$display("%d = %b", f, f);
		$display("C(2) de (26 - 36) = %d = %b", g, g);

 
 
 		
 end 
 
endmodule // test_base 
 