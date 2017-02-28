 module MEIADIFERENCA(temp1,carry,a,b);
	input a, b;
	output carry,temp1;
		
  xor XOR1(temp1,a,b);
  not NOT1(temp2,a);
  and AND1(carry,temp2,b);
  
   endmodule
	
	
	module TESTEMEIADIFERENCA;

	reg a,b,c;
	wire diferenca,carry,temp1,carry2,sinal;

	MEIADIFERENCA MEIADIFERENCA1 (temp1,carry,a,b);
	MEIADIFERENCA MEIADIFERENCA2(diferenca,carry2,temp1,c);
	or OR1(sinal,carry2,carry);

	initial begin
		a = 0;b = 0;c=0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | c | Sinal  | Diferenca ");
		$monitor (" %b | %b | %b |   %b    |  %b", a,b,c,sinal,diferenca);
		#1 a = 0;b = 0;c=1;
		#1 a = 0;b = 1;c=0;
		#1 a = 0;b = 1;c=1;
		#1 a = 1;b = 0;c=0;
		#1 a = 1;b = 0;c=1;
		#1 a = 1;b = 1;c=0;
		#1 a = 1;b = 1;c=1;


	end	
     endmodule

	