module latchD (q, q1, d, c);

	input d, c;
	output q, q1;
	wire w1, w2;
	
	nand (w1, d, c);
	nand (w2, ~d, c);
	nand (q, w1, q1);
	nand (q1, w2, q);

endmodule //latchD
/*
module clock (clk);
 output clk;
 reg    clk;

 initial
  begin
   clk = 1'b0;
  end

 always
  begin
   #1 clk = ~clk;
  end
endmodule //endClock
*/
module Exercicio01;

	reg [0:4]a;
	reg d, clk;
	wire q, q1, q2, q3, q4, q5, s;
	
	//clock clk (clk);
	latchD L1 (q, q1, d, clk);
	latchD L2 (q2, q3, q, clk);
	latchD L3 (q4, q5, q2, clk);
	and (s, q, q3, q4);
	
	initial
	begin
		
		a = 5'b10101;
		#1 d = a[0]; clk = 0;
		$monitor ("a = %b dado = %b  saida = %b", a, d, s); 
		#1 d = a[0]; clk = 1;
		#1 d = a[1]; clk = 0;
		#1 d = a[1]; clk = 1;
		#1 d = a[2]; clk = 0;
		#1 d = a[2]; clk = 1;
		#1 d = a[3]; clk = 0;
		#1 d = a[3]; clk = 1;	
		#1 d = a[4]; clk = 0;
		#1 d = a[4]; clk = 1;
				
	end
endmodule