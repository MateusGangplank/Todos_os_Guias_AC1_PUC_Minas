//Wadson Ferreira
//460631

`define encontrado 1
`define naoEncontrado 0

module finito(output encontrado, input entrada, input clock, input reset);

parameter start = 3'b000;
parameter id1 = 3'b001;
parameter id11 = 3'b011;
parameter id110 = 3'b110;
reg[2:0] E1;
reg[2:0] E2;
reg encontrado;
reg NenhumaOcorrencia=1'b1;

always @(entrada or E1)
	begin
		encontrado=`naoEncontrado;
		if(NenhumaOcorrencia) begin
			case(E1)
				start: if(entrada) E2=id1; else E2=start;
				id1: if(entrada) E2=id11; else E2=start;
				id11: if(entrada) E2=start; else E2=id110;//garante a interseção de 0
				id110: if(entrada) E2=start; else begin E2=start; encontrado=`encontrado; NenhumaOcorrencia=1'b0; end
				default: E2=3'bxxx;
			endcase
		end
	end
always @(posedge clock or negedge reset)
	begin
	if(reset)
		E1=E2;
	else
		E1=0;
	end
endmodule

module Exemplo0054;
reg clock, reset, entrada;
wire saida;
finito F(saida,entrada,clock,reset);
initial begin
	$display("Tempo - Entrada - Saida");
	clock=1; reset=0; entrada=0;
	#5 reset=1;
	#10 entrada=0;
	#10 entrada=1;
	#10 entrada=0;
	#10 entrada=1;
	#10 entrada=0;
	#10 entrada=1;
	#10 entrada=1;
	#10 entrada=0;
	#10 entrada=0;
	#10 entrada=1;
	#10 entrada=1;
	#10 entrada=0;
	#10 entrada=0;
	#10 $finish;
end
always #5 clock = ~clock;
always @(posedge clock)
	begin
		$display("%4d %b %b",$time,entrada,saida);
	end
endmodule
