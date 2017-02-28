// Exemplo0001 - buffer
// Nome: Vitor Angelo Lima
// Matricula: 451621

module buffer (output s, input p);
	assign s = p;
endmodule

module testbuffer;
	reg a;
	wire s;
	buffer BF1 (s, a);

	initial begin:start
		a=0;
	end

	initial begin:main
		$display("Exemplo 0001 - Vitor Angelo Lima - 451621");
		$display("Test buffer:");
		$display("\t	time\ta = s");
		$monitor("%d\t%b = %b", $time, a, s);
		#1 a=1;
		#2 a=0;
	end
endmodule
