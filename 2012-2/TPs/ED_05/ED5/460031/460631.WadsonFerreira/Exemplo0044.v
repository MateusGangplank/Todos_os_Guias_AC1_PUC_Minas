//modulo pulse com #4
//Wadson Ferreira
//460631

module pulse(output saida);
	reg saida;
	initial begin
		saida=1'b0;
	end
	always
	begin
		#4 saida = ~saida;
	end
endmodule

module Exemplo0044;
	wire pulse;
	pulse P1(pulse);
	initial begin
		$dumpfile("Exemplo0044.vcd");
		$dumpvars(pulse);
		#40 $finish;
	end
endmodule
