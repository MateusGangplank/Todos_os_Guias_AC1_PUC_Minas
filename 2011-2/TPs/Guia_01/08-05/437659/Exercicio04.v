// ------------------------- 
// Exercicio04 - AND
// Nome: Debora Amaral Chaves 
// Matricula: 437659
// ------------------------- 
 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate (output s, input p, input q, input r);
	assign s = p & q & r;
endmodule

module testandgate;
	reg a, b, c;
	wire s;
	andgate AND1 (s, a ,b, c);
initial 
	begin
		a = 0;
		b = 0;
		c = 0;
	end

initial 
	begin
		$display("Exercicio04 - Debora Amaral Chaves - 437659"); 
      $display("Test AND gate"); 
      $display("\na & b & c = s\n"); 
      a=0; b=0; c=0;
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 c=1;
		#1 b=1;
			c=0;
		#1	c=1;
		#1 a=1;
			b=0;
			c=0;
		#1 c=1;
		#1 c=0;
			b=1;
		#1 c=1;
			
	end

endmodule

    // Exercicio04 - Debora Amaral Chaves - 437659
    // Test AND gate
    // 
    // a & b & c = s
    // 
    // 0 & 0 & 0 = 0
    // 0 & 0 & 1 = 0
    // 0 & 1 & 0 = 0
    // 0 & 1 & 1 = 0
    // 1 & 0 & 0 = 0
    // 1 & 0 & 1 = 0
    // 1 & 1 & 0 = 0
    // 1 & 1 & 1 = 1