//Wadson Ferreira
//460631
//OBS: Não consegui mostrar apenas em posedge
//porque estava omitindo movimentações.

module shift(output[4:0] saida, input entrada, input clock, input reset);
	reg[4:0] saida=5'b00000;
	wire not4;
	not N1(not4,saida[4]);
	wire entradaProcessada;
	or O1(entradaProcessada,not4,entrada);
	always @(posedge clock) begin
		saida[4]=saida[3];              // usar os flip-flops
		saida[3]=saida[2];
		saida[2]=saida[1];
		saida[1]=saida[0];
		saida[0]=entradaProcessada;
	end
endmodule

module Exercicio04;
	wire[4:0] saida;
	reg entrada,clock;
	shift S(saida,entrada, clock,0);
	initial begin
		clock=0;
		#5 entrada=1;
		#5 entrada=0;
		#10 entrada=0;
		#10 entrada=0;
		#10 entrada=0;
		#10 entrada=1;
		#10 entrada=1;
		#10 entrada=0;
		#10 $finish;
	end
	always begin #5 clock=~clock; end
	always @(clock) begin
		$display("%d %b %b",$time,entrada,saida);
	end
endmodule