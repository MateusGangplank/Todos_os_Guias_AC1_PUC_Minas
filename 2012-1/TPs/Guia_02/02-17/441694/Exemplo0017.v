// ------------------------- 
// Exemplo0017 
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
		reg [8:0] f;
		reg [4:0] g;
		
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0017 - Lucas Cardoso - 441694");  
 
      a = 'b101010;
      b = 'b11010; 
       
      $display("\na = %d = %b", a, a); 
      $display("b = %d = %b", b, b); 
      $display("a + b = %d = %b", a+b, a+b); 
		
		a = 'b11010;
		d = 'o25;
		
		$display("\na = %d = %b", a, a);
		$display("d = %d = %b", d, d);
		$display("a + d = %d = %b", a+d,  a+d);
		
		e = 'o1234;
		c = 'h2B
		
		$display("\ne = %d = %b", e, e);
		$display("c = %d = %b", c, c);
		$display("e / c = %d = %b", e/c, e/c);
		
		f = 'h1CA;
		e = 'b101110001;
		
		$display("\nf = %d = %b", f, f);
		$display("e = %d = %b", e, e);
		$display("f - e = %d = %b", f-e, f-e);
		
		g = 25;
      b = 'o31;
      c = 'h7A;

		$display("\ng = %d = %b", g, g);
		$display("b = %d = %b", b, b);
		$display("c = %d = %b", c, c);
		$display("g * b + c = %d = %b", g*b+c, g*b+c);
 
 
 		
 end 
 
endmodule // test_base 
 