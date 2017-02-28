module Exercicio04(s, a, b);
	output s;
	input a, b, c;
	assign s = a ^ b;
endmodule

module testeExercicio04;
	reg a, b;
	wire s;

	Exercicio04 EX04 (s, a, b);

	initial begin
		a = 0;
		b = 0;
	end

	initial begin

		$display("Felipe Pacifico -- 389868");
		$display("Tabela verdade da porta XOR com 2 entradas\n");

		$display(" a ^ b  =  s");
		#1 $display(" %b   %b     %b", a, b, s);

		#1 a = 0; b = 1;
		#1 $display(" %b   %b     %b", a, b, s);

		#1 a = 1; b = 0;
		#1 $display(" %b   %b     %b", a, b, s);

		#1 a = 1; b = 1;
		#1 $display(" %b   %b     %b", a, b, s);

	end

endmodule