// ------------------------- 
// Exemplo0019 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [5:0] a;
      reg [7:0] b;
      reg [6:0] c;
      reg [6:0] d;
      reg [6:0] e;
      reg [6:0] f;
      reg [4:0] g;
      reg [4:0] h;
		
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0019 - Lucas Cardoso - 441694");  
 
      a = 6'b101010;
      b = ~a + 1'b1;
       
      $display("\nx = %d = %b", a, a); 
      $display("C(2) de x = %d = %b", b, b); 
		
		c = 7'b011011;
      d = ~c + 1'b1;
		
		$display("\nx = %d = %b", c, c);
		$display("C(2) de x = %d = %b", d, d);
		
		c = 23;
      d = ~c + 1'b1;
		
		$display("\nx = %d = %b", c, c);
		$display("C(2) de x = %d = %b", d, d);
		
		g = 5'hE;
      h = ~g + 1'b1;
		
		$display("\nx = %d = %b", g, g);
		$display("C(2) de x = %d = %b", h, h);
		
		g = 5'o26;
      b = ~g + 1'b1;

		$display("\nx = %d = %b", g, g);
		$display("C(2) de x = %d = %b", b, b);

 
 
 		
 end 
 
endmodule // test_base 
 