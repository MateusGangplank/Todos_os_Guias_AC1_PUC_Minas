module Exercicio04(s, a, b, c);
	output s;
	input a, b, c;
	assign s = ~ (a & b & c);
endmodule

module testeExercicio04;
	reg a, b, c;
	wire r, s, t, w, z;

	Exercicio04 NAND1 (r, a, a, a);
	Exercicio04 NAND2 (s, b, b, b);
	Exercicio04 NAND3 (t, c, c, c);
	Exercicio04 NAND4 (w, r, s, t);
	Exercicio04 NAND5 (z, w, w, w);

	initial begin
		a = 0;
		b = 0;
		c = 0;
	end

	initial begin

		$display("Exercicio 04 - Douglas Borges - 417889");
		$display("Tabela verdade da porta NOR com 3 entradas utilizando portas NAND\n");

		#1 $display(" ~( a | b | c )  =  s  =>  ~( ~(a&a&a) & ~(b&b&b) & ~(c&c&c) )  =  s1  =>  ~( s1 & s1 & s1 )  =  s");
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
Exercicio 04 - Douglas Borges - 417889
Tabela verdade da porta NOR com 3 entradas utilizando portas NAND

 ~( a | b | c )  =  s  =>  ~( ~(a&a&a) & ~(b&b&b) & ~(c&c&c) )  =  s1  =>  ~( s1 & s1 & s1 )  =  s
    0   0   0       1             1          1          1          0          0    0    0        1
    0   0   1       0             1          1          0          1          1    1    1        0
    0   1   0       0             1          0          1          1          1    1    1        0
    0   1   1       0             1          0          0          1          1    1    1        0
    1   0   0       0             0          1          1          1          1    1    1        0
    1   0   1       0             0          1          0          1          1    1    1        0
    1   1   0       0             0          0          1          1          1    1    1        0
    1   1   1       0             0          0          0          1          1    1    1        0
*/

endmodule