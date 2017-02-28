// ------------------------- 
// Exemplo0017v2 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [5:0] a; 
      reg [4:0] b;
		reg [6:0] c;
		reg [5:0] d;
		reg [9:0] e; 
      reg [10:0] f;
      reg [8:0] g;
      reg [4:0] h;
		
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0017 - Lucas Cardoso - 441694");  
 
      a = 6'b101010;
      b = 5'b11010;
      c = a + b; 
       
      $display("\na = %d = %b", a, a); 
      $display("b = %d = %b", b, b); 
      $display("a + b = %d = %b", c, c); 
		
		a = 5'b11010;
      d = 'o25;
      c = a + d;
		
		$display("\na = %d = %b", a, a);
		$display("d = %d = %b", d, d);
		$display("a + d = %d = %b", c,  c);
		
		e = 'o1234;
      c = 'h2B;
      f = e / c;
		
		$display("\ne = %d = %b", e, e);
		$display("c = %d = %b", c, c);
		$display("e / c = %d = %b", f, f);
		
		g = 'h1CA;
      e = 9'b101110001;
      f = g - e;
		
		$display("\nf = %d = %b", g, g);
		$display("e = %d = %b", e, e);
		$display("f - e = %d = %b", f, f);
		
		h = 25;
      b = 'o31;
      c = 'h7A;
      f = h* b + c ;

		$display("\nh = %d = %b", h, h);
		$display("b = %d = %b", b, b);
		$display("c = %d = %b", c, c);
		$display("h * b + c = %d = %b", f, f);
 
 
 		
 end 
 
endmodule // test_base 
 