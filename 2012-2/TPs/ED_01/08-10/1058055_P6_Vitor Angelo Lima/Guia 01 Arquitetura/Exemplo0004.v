// Exemplo0004 - OR
// Nome: Vitor Angelo Lima
// Matricula: 451621

module orgate (output s, input p, input q);
	assign s = p | q;
endmodule

module testorgate;
	reg a, b;
	wire s;
	orgate OR1 (s, a, b);

	initial begin:start
		a=0; b=0;
	end

	initial begin:main
		$display("Exemplo 0004 - Vitor Angelo Lima - 451621");
		$display("Test OR gate");
		$display("\na | b = s\n");
	a=0; b=0;
	#1 $display("%b | %b = %b", a, b, s);
	a=0; b=1;
	#1 $display("%b | %b = %b", a, b, s);
	a=1; b=0;
	#1 $display("%b | %b = %b", a, b, s);
	a=1; b=1;
	#1 $display("%b | %b = %b", a, b, s);
	end
endmodule


