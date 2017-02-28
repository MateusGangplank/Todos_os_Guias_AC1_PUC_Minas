module Exercicio02(s, a, b, c);
	output s;
	input a, b, c;
	assign s = ~ (a | b | c);
endmodule

module testeExercicio02;
	reg a, b, c;
	wire r, s, t, w;

	Exercicio02 NOR1 (r, a, a, a);
	Exercicio02 NOR2 (s, b, b, b);
	Exercicio02 NOR3 (t, c, c, c);
	Exercicio02 NOR4 (w, r, s, t);

	initial begin
		a = 0;
		b = 0;
		c = 0;
	end

	initial begin

		$display("Exercicio 02 - Douglas Borges - 417889");
		$display("Tabela verdade da porta AND com 3 entradas utilizando portas NOR\n");

		#1 $display(" a & b & c  =  s  =>  ~( ~(a|a|a) | ~(b|b|b) | ~(c|c|c) ) = s");
		#1 $monitor(" %b   %b   %b     %b             %b          %b          %b        %b", a, b, c, w, r, s, t, w);
		#1 a = 0; b = 0; c = 1;
		#1 a = 0; b = 1; c = 0;
		#1 a = 0; b = 1; c = 1;
		#1 a = 1; b = 0; c = 0;
		#1 a = 1; b = 0; c = 1;
		#1 a = 1; b = 1; c = 0;
		#1 a = 1; b = 1; c = 1;

	end

/*
Exercicio 02 - Douglas Borges - 417889
Tabela verdade da porta AND com 3 entradas utilizando portas NOR

 a & b & c  =  s  =>  ~( ~(a|a|a) | ~(b|b|b) | ~(c|c|c) ) = s
 0   0   0     0             1          1          1        0
 0   0   1     0             1          1          0        0
 0   1   0     0             1          0          1        0
 0   1   1     0             1          0          0        0
 1   0   0     0             0          1          1        0
 1   0   1     0             0          1          0        0
 1   1   0     0             0          0          1        0
 1   1   1     1             0          0          0        1
*/

endmodule