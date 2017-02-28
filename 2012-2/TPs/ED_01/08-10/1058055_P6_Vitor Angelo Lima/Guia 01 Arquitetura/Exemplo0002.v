// Exemplo0002 - NOT
// Nome: Vitor Angelo Lima
// Matricula: 451621

module notgate (output s, input p);
	assign s = ~p;
endmodule

module testnotgate;
	reg a;
	wire s;
	notgate NOT1 (s, a);

	initial begin:start
		a=0;
	end

	initial begin:main
		$display("Exemplo 0002 - Vitor Angelo Lima - 451621");
		$display("Test NOT gate");
		$display("\n~a = s\n");
		a=0;
		#1 $display("~%b = %b", a, s);
		a=1;
		#1 $display("~%b = %b", a, s);
	end
endmodule


