module Exercicio03(s, a, b, c);
	output s;
	input a, b, c;
	assign s = ~ (a & b & c);
endmodule

module testeExercicio03;
	reg a;
	wire s;

	Exercicio03 NAND1 (s, a, a, a);

	initial begin
		a = 0;
	end

	initial begin

		$display("Exercicio 03 - Douglas Borges - 417889");
		$display("Tabela verdade da porta NOT utilizando portas NAND\n");

		#1 $display(" ~a  =  s  =>  ~( ~(a&a&a) )");
		#1 $monitor("  %b     %b             %b", a, s, s);
		#1 a = 1;

	end

/*
Exercicio 03 - Douglas Borges - 417889
Tabela verdade da porta NOT utilizando portas NAND

 ~a  =  s  =>  ~( ~(a&a&a) )
  0     1             1
  1     0             0
*/

endmodule