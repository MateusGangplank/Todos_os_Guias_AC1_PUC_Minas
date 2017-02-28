 module MEIASOMA(temp1,carry,a,b);
	input a, b;
	output carry,temp1;
		
  xor XOR1(temp1,a,b);
  and AND1(carry,a,b);
  
   endmodule
	
	
	module TESTEMEIASOMA;

	reg a,b,c;
	wire soma,carry,temp1,carry2,carryout;

	MEIASOMA MEIASOMA1 (temp1,carry,a,b);
	MEIASOMA MEIASOMA (soma,carry2,temp1,c);
	or OR1(carryout,carry2,carry);

	initial begin
		a = 0;b = 0;c=0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | c | carryout  | soma ");
		$monitor (" %b | %b | %b |   %b      |  %b", a,b,c,carryout,soma);
		#1 a = 0;b = 0;c=1;
		#1 a = 0;b = 1;c=0;
		#1 a = 0;b = 1;c=1;
		#1 a = 1;b = 0;c=0;
		#1 a = 1;b = 0;c=1;
		#1 a = 1;b = 1;c=0;
		#1 a = 1;b = 1;c=1;


	end	
     endmodule

	