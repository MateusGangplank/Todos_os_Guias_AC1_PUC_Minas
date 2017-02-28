 module Exercicio03MEIADIFERENCA(soma,carry,a,b);
	input a, b;
	output soma,carry;
	wire temp1,temp2,s1,s2,temp3;
	
	nand NAND1 (temp1,a,b);
	nand NAND2 (temp2,a,temp1);
	nand NAND2 (temp3,b,temp1);
	nand NAND2 (soma,temp2,temp3);
	nand NAND2 (temp5,a,a);
	nand NAND2 (temp4,temp5,b);
	nand NAND2 (carry,temp4,temp4);

   endmodule

    module TesteExercicio03MEIADIFERENCA;

	reg a,b;
	wire soma,carry;

	Exercicio03MEIADIFERENCA MEIADIFERENCA1 (soma,carry,a,b);

	initial begin
		a = 0;b = 0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | carry | Diferenca ");
		$monitor (" %b | %b |   %b   |  %b", a,b,carry,soma);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;


	end	
     endmodule
