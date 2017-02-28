// ---------------------
// Exe01 - Half Hadder
// Nome: Marden Santos Batista
// Matricula: 388613
// ---------------------

//Modulo Meia Soma
module halfAdder(s0, s1, a, b);
	output s0, s1;
	input a, b;
	wire w1, w2;
	and AND01 (s0, a, b);
	or OR01 (w1, a, b);
	not NOT01 (w2, s0);
	and AND02 (s1, w1, w2);
endmodule
//Modulo Teste Meia Soma
module testeHalfAdder;
	reg reg1, reg2;
	wire w1, w2;

	halfAdder HalfAdder01 (w1, w2, reg1, reg2);

	initial begin
		reg1 = 0; reg2 = 0; //Valores iniciais
	end
	initial begin
		$display("Exercicio 01 - Marden Batista - 388613");
		$display("Half Hadder (Tradicional) \n");
		#1 $monitor("  %d + %d =  %d    %d", reg1, reg2, w1, w2);
		#1 reg1 = 0; reg2 = 1;
		#1 reg1 = 1; reg2 = 0;
		#1 reg1 = 1; reg2 = 1;
	end
endmodule