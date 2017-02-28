module Exercicio05(s, a, b, c);
	output s;
	input a, b, c;
	assign s = ~ (a | b | c);
endmodule

module testeExercicio05;
	reg a, b, c;
	wire r, s, t, w, z;

	Exercicio05 NOR1 (r, a, a, a);
	Exercicio05 NOR2 (s, b, b, b);
	Exercicio05 NOR3 (t, c, c, c);
	Exercicio05 NOR4 (w, r, s, t);
	Exercicio05 NOR5 (z, w, w, w);

	initial begin
		a = 0;
		b = 0;
		c = 0;
	end

	initial begin

		$display("Exercicio 05 - Douglas Borges - 417889");
		$display("Tabela verdade da porta NAND com 3 entradas utilizando portas NOR\n");

		#1 $display(" ~( a & b & c )  =  s  =>  ~( ~(a|a|a) | ~(b|b|b) | ~(c|c|c) )  =  s1  =>  ~( s1 | s1 | s1 )  =  s");
		#1 $monitor("    %b   %b   %b       %b             %b          %b          %b          %b          %d    %d    %d        %d", a, b, c, z, r, s, t, w, w, w, w, z);
		#1 a = 0; b = 0; c = 1;
		#1 a = 0; b = 1; c = 0;
		#1 a = 0; b = 1; c = 1;
		#1 a = 1; b = 0; c = 0;
		#1 a = 1; b = 0; c = 1;
		#1 a = 1; b = 1; c = 0;
		#1 a = 1; b = 1; c = 1;

	end

/*
Exercicio 05 - Douglas Borges - 417889
Tabela verdade da porta NAND com 3 entradas utilizando portas NOR

 ~( a & b & c )  =  s  =>  ~( ~(a|a|a) | ~(b|b|b) | ~(c|c|c) )  =  s1  =>  ~( s1 | s1 | s1 )  =  s
    0   0   0       1             1          1          1          0          0    0    0        1
    0   0   1       1             1          1          0          0          0    0    0        1
    0   1   0       1             1          0          1          0          0    0    0        1
    0   1   1       1             1          0          0          0          0    0    0        1
    1   0   0       1             0          1          1          0          0    0    0        1
    1   0   1       1             0          1          0          0          0    0    0        1
    1   1   0       1             0          0          1          0          0    0    0        1
    1   1   1       0             0          0          0          1          1    1    1        0
*/

endmodule