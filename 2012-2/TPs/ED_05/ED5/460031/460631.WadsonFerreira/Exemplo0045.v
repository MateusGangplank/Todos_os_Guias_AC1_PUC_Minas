//modulo pulse com #24
//Wadson Ferreira
//460631

module pulse(output saida);
	reg saida;
	initial begin
		saida=1'b0;
	end
	always
	begin
		#24 saida = ~saida;
	end
endmodule

module Exemplo0045;
	wire pulse;
	pulse P1(pulse);
	initial begin
		$dumpfile("Exemplo0045.vcd");
		$dumpvars(pulse);
		#480 $finish;
	end
endmodule
