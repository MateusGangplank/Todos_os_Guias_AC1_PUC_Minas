module ORNANDS(temp1,a,b);
input a,b;
output temp1;
wire temp2,temp3;

nand NAND1(temp2,a,a);
nand NAND2(temp3,b,b);
nand NAND3(temp1,temp2,temp3);

 endmodule

module ANDNANDS(carry,a,b);
input a,b;
output carry;
wire temp5;

nand NAND1(temp5,a,b);
nand NAND1(carry,temp5,temp5);

 endmodule
 
 
 
module NOTNANDS(temp6,carry);
input carry;
output temp6;


nand NAND1(temp6,carry,carry);

 endmodule
 
 module MEIASOMA(soma,carry,a,b);
	input a, b;
	output soma,carry;
		
  ORNANDS OR1(temp1,a,b);
  ANDNANDS AND1(carry,a,b);
  NOTNANDS NOT1(temp6,carry);
  ANDNANDS NAND2(soma,temp1,temp6);
  

   endmodule

 module TESTEMEIASOMA;

	reg a,b;
	wire soma,carry;

	MEIASOMA MEIASOMA1 (soma,carry,a,b);

	initial begin
		a = 0;b = 0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | soma  | carry ");
		$monitor (" %b | %b |   %b   |  %b", a,b,soma,carry);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;


	end	
     endmodule
