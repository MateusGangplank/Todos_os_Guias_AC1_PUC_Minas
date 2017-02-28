//Gerador de clock, pulse e trigger
//Wadson Ferreira
//460631
 
module clock(output clk);
	reg clk;
	initial begin
		clk=1'b0;
	end
	always begin
		#12 clk = ~clk;
	end
endmodule

module pulse(output sinal, input clock);
	reg sinal;
	always @ (clock)
	begin
		sinal = 1'b1;
		#3 sinal=1'b0;
		#3 sinal=1'b1;
		#3 sinal=1'b0;
	end
endmodule

module trigger(output sinal, input on, input clock);
	reg sinal;
	always @ (posedge clock & on)
	begin
		#60 sinal = 1'b1;
		#60 sinal = 1'b0;
	end
endmodule

module testes;
	wire clk;
	clock CLK(clk);
	reg p;
	wire pulse1, trigger1;
	pulse P1(pulse1,clock);
	trigger T1(trigger1,p,clock);
	initial begin
		p=1'b0;
	end
	initial begin
		$dumpfile("Exemplo0042.vcd");
		$dumpvars(1,clock,pulse1,p,trigger1);
		#060 p = 1'b1;
		#120 p = 1'b0;
		#180 p = 1'b1;
		#240 p = 1'b0;
		#300 p = 1'b1;
		#360 p = 1'b0;
		#376 $finish;
	end
endmodule
