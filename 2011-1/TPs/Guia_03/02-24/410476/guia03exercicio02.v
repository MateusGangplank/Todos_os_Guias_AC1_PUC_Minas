
  module Exercicio02MEIASOMA(soma,carry,a,b);
	input a, b;
	output soma,carry;
	wire temp1,temp2,s1,s2,temp3;
	
	nand NAND1 (s1,a,a);
	nand NAND2 (s2,b,b);
	nand NAND2 (temp1,s1,s2);
	nand NAND2 (temp2,a,b);
	nand NAND2 (temp3,temp1,temp2);
	nand NAND2 (soma,temp3,temp3);
	nand NAND2 (carry,temp2,temp2);

   endmodule

    module TesteExercicio02MEIASOMA;

	reg a,b;
	wire soma,carry;

	Exercicio02MEIASOMA MEIASOMA1 (soma,carry,a,b);

	initial begin
		a = 0;b = 0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | carry | soma ");
		$monitor (" %b | %b |   %b   |  %b", a,b,carry,soma);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;


	end	
     endmodule
