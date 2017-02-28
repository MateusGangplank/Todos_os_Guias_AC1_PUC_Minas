 // ---------------------
// guia03-Exercicio04extra
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// -- Meia soma
// ---------------------

  module Exercicio04MEIASOMA(soma,carry,a,b);
	input a, b;
	output soma,carry;
	wire temp1,temp2,temp3,temp4,temp5,temp6,temp7;
	
	nor NOR1 (temp1,a,b);
	nor NOR2 (temp2,temp1,temp1);
	nor NOR3 (temp3,temp2,temp2);
	nor NOR4 (temp4,a,a);
	nor NOR5 (temp5,b,b);
	nor NOR6 (carry,temp4,temp5);
	nor NOR7 (temp6,carry,carry);
	nor NOR8 (temp7,temp6,temp6);
	nor NOR10 (soma,temp3,temp7);

   endmodule

    module TesteExercicio04MEIASOMA;

	reg a,b;
	wire soma,carry;

	Exercicio04MEIASOMA MEIASOMA1 (soma,carry,a,b);

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
