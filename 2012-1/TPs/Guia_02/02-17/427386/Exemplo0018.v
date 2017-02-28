// -------------------------
// Exemplo0012 - BASE
// Nome: Andre Henriques Fernandes
// Matricula: 427386	
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
     reg [2:0] a;
     reg [3:0] b;
     reg [4:0] c;
	  reg [4:0] d;
	  
	  reg [5:0] x;
	  reg [5:0] y;
	  reg [9:0] z;
	  reg [5:0] w;
	  reg [9:0] k;
	  
	  reg [5:0] c2;
	  reg [4:0] c3;
	  reg [7:0] c4;
	  reg [6:0] c5;
	  reg [5:0] c6;
	  reg [4:0] c7;
	  reg [7:0] c8;
	  
// ------------------------- parte principal
initial begin
      $display("Exemplo0012 - Andre Henriques Fernandes - 427386");
      $display("Test number system");
		a =   5;
		b =  10;
		c =  15;
		d =  20;
		$display("\nPositive value");
      $display("a = %d = %3b", a, a);
		$display("b = %d = %4b", a, a);
		$display("c = %d = %5b", a, a);
      $display("b = %d = %4b", b, b);
		$display("c = %d = %5b", c, c);
		$display("d = %d = %5b", d, d);
		$display("d = %d = %5o", d, d);
		$display("d = %d = %5h", d, d);

		a = -5;
      b = -5;
      c = -5;
      $display("\nNegative value");
      $display("a = -5 [3] = %d = %3b", a, a);
      $display("b = -5 [4] = %d = %4b", b, b);
      $display("c = -5 [5] = %d = %5b", c, c);


		a = ~5+1;
		b = ~5+1;
      c = ~5+1;
		$display("\nNegative mixed expression");
      $display("a = %d = %3b", a, a);
		$display("b = %d = %4b", b, b);
		$display("c = %d = %5b", c, c);
		
		a = 5 + 3;
		b = 5 + 3;
		c = 10 - 5 + 25 + 3 + 1;
      $display("\nOverflow");
      $display("a = %d = %3b", a, a);
      $display("b = %d = %4b", b, b);
		$display("c = %d = %5b", c, c);
		
		
		$display("\nComplements");
      $display("0= %d = %3b = %3b",   ~1 , (1-1),   ~1    );
      $display("1= %d = %3b = %3b",   ~0   , (2-1),   ~0    );
      $display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);
		
		$display("\nEx01");
//Ex01:
//a)
		x = 2 + 15;
		$display("x = %6b",x);
//b)
		y = 3 * 8;
		$display("y = %6b",y);
//c)
		z = 32 / 3;
		$display("z = %5b",z);
//d)
		w = 21 - 11;
		$display("w = %5b",w);
//e)
		k = 2 * 5 + 6 - 1;
		$display("k = %4b",k);
		
		$display("\nEx02");
//Ex02:
//a)
		x = 6'b101010 + 5'b11010;
		$display("x = %7b",x);
//b)
		y = 5'b11010 + 5'o25;
		$display("y = %6b",y);
//c)
		z = 10'o1234 + 6'h2B;
		$display("z = %10b",z);
//d)
		w = 9'h1CA + 9'b101110001;
		$display("w = %10b",w);
//e)
		k = (5'o25 * 5'o31) + 7'h7A;
		$display("k = %10b",k);

		$display("\nEx03");
//Ex03:
//a)
		c2 = ~(6'b100111) + 1;
		$display("c2 = %6b",c2);
//b)
		c3 = ~(5'o23) + 1;
		$display("c3 = %5b",c3);
//c)
		c3 = ~(5'd23) + 1;
		$display("c3 = %5b",c3);
//d)
		c2 = ~(6'h2B) + 1;
		$display("c2 = %6b",c2);
//e)
		c2 = ~(5'd26 - 6'd36) + 1;
		$display("c2 = %6b",c2);

		$display("\nEx04");
//Ex04:
//a)
		c4 = ~(8'b101010) + 1;
		$display("c4 = %8b",c4);
//b)
		c5 = ~(7'b011011) + 1;
		$display("c5 = %7b",c5);
//c)
		c6 = ~(6'd23) + 1;
		$display("c6 = %6b",c6);
//d)
		c7 = ~(5'hE) + 1;
		$display("c7 = %5b",c7);
//e)
		c8 = ~(8'o26) + 1;
		$display("c8 = %8b",c8);



end
endmodule // test_base

