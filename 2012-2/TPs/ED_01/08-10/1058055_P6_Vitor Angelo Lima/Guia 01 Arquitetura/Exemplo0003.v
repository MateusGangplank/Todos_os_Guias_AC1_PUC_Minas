// Exemplo0003 - AND
// Nome: Vitor Angelo Lima
// Matricula: 451621

module andgate (output s, input p, input q);
	assign s = p & q;
endmodule

module testandgate;
	reg a, b;
	wire s;
	andgate AND (s, a, b);

	initial begin:start
		a=0; b=0;
	end

	initial begin:main
		$display("Exemplo 0003 - Vitor Angelo Lima - 451621");
		$display("Test AND gate");
		$display("\na & b = s\n");
	a=0; b=0;
	#1 $display("%b & %b = %b", a, b, s);
	a=0; b=1;
	#1 $display("%b & %b = %b", a, b, s);
	a=1; b=0;
	#1 $display("%b & %b = %b", a, b, s);
	a=1; b=1;
	#1 $display("%b & %b = %b", a, b, s);
	end
endmodule


