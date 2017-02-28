// ------------------------- 
// Exemplo0016 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [1:0] a; 
      reg [4:0] b;
		reg [1:0] c;
		reg [4:0] d;
		reg [5:0] e; 
		reg [4:0] f;
		reg [3:0] g;
		reg [3:0] h;
		reg [3:0] i;
		reg [1:0] j; 
 
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0016 - Lucas Cardoso - 441694");  
 
      a =   2; 
      b =  15;  
       
      $display("\na = %d = %3b", a, a); 
      $display("b = %d = %4b", b, b); 
      $display("a + b = %d = %5b", a+b, a+b); 
		
		c = 3;
		d = 8;
		
		$display("\nc = %d = %b", c, c);
		$display("d = %d = %b", d, d);
		$display("c * d = %d = %b", c*d,  c*d);
		
		e = 32;
		
		$display("\nc = %d = %b", c, c);
		$display("e = %d = %b", e, e);
		$display("e / c = %d = %b", e/c, e/c);
		
		f = 21;
		g = 11;
		
		$display("\nf = %d = %b", f, f);
		$display("g = %d = %b", g, g);
		$display("f - g = %d = %b", f-g, f-g);
		
		h = 5;
		i = 6;
		j = 1;
	   a = 2;
		
		$display("\na = %d = %b", a, a);
		$display("h = %d = %b", h, h);
		$display("i = %d = %b", i, i);
		$display("j = %d = %b", j, j);
		$display("a * h + i - j = %d = %b", a*h+i-j, a*h+i-j);
 
 
 		
 end 
 
endmodule // test_base 
 