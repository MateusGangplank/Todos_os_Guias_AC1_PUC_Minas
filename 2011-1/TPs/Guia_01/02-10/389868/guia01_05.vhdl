module Exercicio05(s, a, b);
	output s;
	input a, b, c;
	assign s = (~a & b) | (a & ~b);
endmodule

module testeExercicio05;
	reg a, b;
	wire s;

	Exercicio05 EX05 (s, a, b);

	initial begin
		a = 0;
		b = 0;
	end

	initial begin

		$display("Felipe Pacifico -- 389868");
		$display("Tabela verdade da porta XOR com 2 entradas\n");

		$display(" (~a & b) | (a & ~b)  =  s");
		#1 $display("   %d   %d     %d    %d      %d", ~a, b, a, ~b, s);

		#1 a = 0; b = 1;
		#1 $display("   %d   %d     %d    %d      %d", ~a, b, a, ~b, s);

		#1 a = 1; b = 0;
		#1 $display("   %d   %d     %d    %d      %d", ~a, b, a, ~b, s);

		#1 a = 1; b = 1;
		#1 $display("   %d   %d     %d    %d      %d", ~a, b, a, ~b, s);

	end

endmodule