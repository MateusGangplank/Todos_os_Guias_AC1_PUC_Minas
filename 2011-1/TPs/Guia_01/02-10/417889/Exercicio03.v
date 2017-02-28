module Exercicio03(s, a, b, c, d);
	output s;
	input a, b, c, d;
	assign s = ~ (a ^ b ^ c ^ d);
endmodule

module testeExercicio03;
	reg a, b, c, d;
	wire s;

	Exercicio03 EX03 (s, a, b, c, d);

	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 0;
	end

	initial begin

		$display("Exemplo 03 - Douglas Borges - 417889");
		$display("Tabela verdade da porta XNOR com 4 entradas\n");

		$display(" ~ ( a ^ b ^ c ^ d)  =  s");
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 0; b = 0; c = 0; d = 1;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 0; b = 0; c = 1; d = 0;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 0; b = 0; c = 1; d = 1;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 0; b = 1; c = 0; d = 0;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 0; b = 1; c = 0; d = 1;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 0; b = 1; c = 1; d = 0;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 0; b = 1; c = 1; d = 1;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 1; b = 0; c = 0; d = 0;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 1; b = 0; c = 0; d = 1;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 1; b = 0; c = 1; d = 0;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 1; b = 0; c = 1; d = 1;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 1; b = 1; c = 0; d = 0;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 1; b = 1; c = 0; d = 1;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 1; b = 1; c = 1; d = 0;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

		#1 a = 1; b = 1; c = 1; d = 1;
		#1 $display("     %b   %b   %b   %d       %b", a, b, c, d, s);

	end

endmodule