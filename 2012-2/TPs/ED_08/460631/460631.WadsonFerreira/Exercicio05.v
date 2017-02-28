//Wadson Ferreira
//460631

module conversor(output saida, input[4:0] paralela, input clock, input algo);
	reg[4:0] auxiliar;
	reg saidaAux;
	assign saida = saidaAux;
	//initial begin auxiliar = paralela; end
	always @(posedge clock) begin
		auxiliar = paralela > 1;          // usar os flip-flops
		saidaAux = auxiliar[0];
	end
endmodule

module Exercicio05;
	reg[4:0] entrada;
	reg clock, algo;
	wire saida;
	conversor C(saida,entrada,clock,algo);
	initial begin
	entrada=5'b10101;
	#10 algo=0;
	#10 algo=1;
	#10 algo=0;
	#10 algo=1;
	#10 algo=0;
	#10 algo=1;
	#50 $finish;
	end
	always begin #5 clock=~clock; end
	always @(clock) begin
		$display("%d %b %b",$time,entrada,saida,algo);
	end
endmodule
