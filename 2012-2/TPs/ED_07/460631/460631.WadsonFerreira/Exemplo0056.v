//Wadson Ferreira
//460631

`define encontrado 1
`define naoEncontrado 0

module finito(output encontrado, input entrada, input clock, input reset);

parameter start = 3'b110;
parameter start0 = 3'b000;
parameter id00 = 3'b001;
parameter start1 = 3'b011;
parameter id11 = 3'b100;

reg[2:0] E1;
reg[2:0] E2;
reg encontrado;

always @(entrada or E1)
	begin
		encontrado=`naoEncontrado;
			case(E1)
				start: if(entrada) E2=start1; else E2=start0;
				start0: if(entrada) E2=start1; else E2=id00;
				id00: if(entrada) E2=start1; else begin encontrado=`encontrado; E2=start; end
				start1: if(entrada) E2=id11; else E2=start0;
				id11: if(entrada) begin encontrado=`encontrado; E2=start; end else E2=start0;
				default: E2=3'bxxx;
			endcase
	end
always @(posedge clock or negedge reset)
	begin
	if(reset)
		E1=E2;
	else begin
		E1=0; E2=start;
	end end
endmodule

module Exemplo0056;
reg clock, reset, entrada;
wire saida;
finito F(saida,entrada,clock,reset);
initial begin
	$display("Tempo - Entrada - Saida");
	//OBS: Como entrada inicialmente é 0, após identificar dois zeros no início, será identificada uma sequência válida.
	clock=1; reset=0; entrada=0;
	#5 reset=1;
	#10 entrada=0;
	#10 entrada=0;
	#10 entrada=1;
	#10 entrada=0;
	#10 entrada=0;
	#10 entrada=0;
	#10 entrada=1;
	#10 entrada=0;
	#10 entrada=1;
	#10 entrada=1;
	#10 entrada=1;
	#10 entrada=0;
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
