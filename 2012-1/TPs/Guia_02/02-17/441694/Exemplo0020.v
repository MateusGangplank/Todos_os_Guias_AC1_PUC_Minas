// ------------------------- 
// Exemplo0020 
// Nome: Lucas Cardoso 
// Matricula: 441694 
// ------------------------- 
 
// ------------------------- 
//  test number system 
// ------------------------- 
 
module test_base_01; 
// ------------------------- definir dados 
      reg [7:0] a;
      reg [7:0] b;
      reg [7:0] c;
		
// ------------------------- parte principal 
 initial begin 
      $display("Exemplo0020 - Lucas Cardoso - 441694");  
 
      a = 8'b101010;
      b = 8'b1101;
      c = a + (~b + 1'b1);
       
      $display("\na = %d = %b", a, a); 
      $display("b = %d = %b", b, b); 
      $display("a - b = %d = %b", c, c); 
		
		a = 8'b11010; 
      b = 8'o15;
      c = a + (~b + 1'b1);
		
		$display("\na = %d = %b", a, a);
		$display("b = %d = %b", b, b);
		$display("a - b = %d = %b", c,  c);
		
		a = 8'o34; 
      b = 8'hB;
      c = a + (~b + 1'b1);
		
		$display("\na = %d = %b", a, a);
		$display("b = %d = %b", b, b);
		$display("a - b = %d = %b", c, c);
		
		a = 8'hCA; 
      b = 8'b10111001;
      c = a + (~b + 1'b1);
		
		$display("\na = %d = %b", a, a);
		$display("b = %d = %b", b, b);
		$display("a - b = %d = %b", c, c);
		
		a = 25; 
      b = 8'h1A;
      c = a + (~b + 1'b1);

		$display("\na = %d = %b", a, a);
		$display("b = %d = %b", b, b);
		$display("a - b = %d = %b", c, c);
 
 
 		
 end 
 
endmodule // test_base 
 