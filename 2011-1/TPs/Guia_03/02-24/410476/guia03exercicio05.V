 // ---------------------
// guia03-Exercicio05extra
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// -- Meia soma
// ---------------------

  module Exercicio05MEIADIFERENCA(soma,carry,a,b);
	input a, b;
	output soma,carry;
	wire temp1,temp2,temp3,temp4,temp5,temp6,temp7;
	
	nor NOR1 (temp1,a,a);
	nor NOR2 (temp2,b,b);
	nor NOR3 (temp3,a,b);
	nor NOR4 (temp4,temp1,temp2);
	nor NOR5 (soma,temp4,temp3);
	nor NOR6 (temp5,temp1,temp1);
	nor NOR10 (carry,temp5,temp2);

   endmodule

    module TesteExercicio05MEIADIFERENCA;

	reg a,b;
	wire soma,carry;

	Exercicio05MEIADIFERENCA MEIADIFERENCA1 (soma,carry,a,b);

	initial begin
		a = 0;b = 0;
	end

	initial begin

		#1 $display (" Larissa Fernandes Leijoto - 410476 ");
		#1 $display (" a | b | carry | Diferenca");
		$monitor (" %b | %b |   %b   |  %b", a,b,carry,soma);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;


	end	
     endmodule
