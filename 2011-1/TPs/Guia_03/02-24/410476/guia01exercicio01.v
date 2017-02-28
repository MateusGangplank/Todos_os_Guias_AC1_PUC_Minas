// ---------------------
// guia03-Exercicio01
// Nome: Larissa Fernandes Leijoto
// Matricula: 410476
// ---------------------

// ---------------------
// -- Meia soma
// ---------------------

  module Exercicio01MEIASOMA(soma,carry,a,b);
	input a, b;
	output soma,carry;
	wire temp1,temp2;
	
	and AND1 (carry,a,b);
	or  OR1 (temp1,a,b);
	not NOT1 (temp2,carry);
	and AND2 (soma,temp1,temp2);

   endmodule

    module TesteExercicio01MEIASOMA;

	reg a,b;
	wire soma,carry;

	Exercicio01MEIASOMA MEIASOMA1 (soma,carry,a,b);

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
