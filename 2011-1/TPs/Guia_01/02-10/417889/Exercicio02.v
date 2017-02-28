module Exercicio02(s, a, b, c);
	output s;
	input a, b, c;
	assign s = ~ (a | b | c);
endmodule

module testeExercicio02;
	reg a, b, c;
	wire s;

	Exercicio02 EX02 (s, a, b, c);

	initial begin
		a = 0;
		b = 0;
		c = 0;
	end

	initial begin

		$display("Exemplo 02 - Douglas Borges - 417889");
		$display("Tabela verdade da porta NOR com 3 entradas\n");

		$display(" ~ ( a | b | c )  =  s");
		#1 $display("     %b   %b   %b       %b", a, b, c, s);

		#1 a = 0; b = 0; c = 1;
		#1 $display("     %b   %b   %b       %b", a, b, c, s);

		#1 a = 0; b = 1; c = 0;
		#1 $display("     %b   %b   %b       %b", a, b, c, s);

		#1 a = 0; b = 1; c = 1;
		#1 $display("     %b   %b   %b       %b", a, b, c, s);

		#1 a = 1; b = 0; c = 0;
		#1 $display("     %b   %b   %b       %b", a, b, c, s);

		#1 a = 1; b = 0; c = 1;
		#1 $display("     %b   %b   %b       %b", a, b, c, s);

		#1 a = 1; b = 1; c = 0;
		#1 $display("     %b   %b   %b       %b", a, b, c, s);

		#1 a = 1; b = 1; c = 1;
		#1 $display("     %b   %b   %b       %b", a, b, c, s);

	end

endmodule