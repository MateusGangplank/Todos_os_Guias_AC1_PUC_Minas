//Wadson Ferreira
//460631

`include "jkff2.v"

module contador(output[5:0] saida, input clock, input reset);
	wire porta, clock0, clock1, clock2, clock3, clock4;
	reg j=1;
	reg k=1;
	reg clear;
	reg clearAuxiliar=0;
	always @(posedge clock) begin
		case (clearAuxiliar)
			0: if(clock4 & saida[1] & clock2 & saida[3] & clock0 & porta) begin
				clearAuxiliar=1; clear=1;
			   end
			1: begin clearAuxiliar=0; clear=0; end
		endcase
	end 
	jkff JK5(saida[0],clock4,j,k,clock,clear);
	jkff JK4(saida[1],clock3,j,k,clock4,clear);
	jkff JK3(saida[2],clock2,j,k,clock3,clear);
	jkff JK2(saida[3],clock1,j,k,clock2,clear);
	jkff JK1(saida[4],clock0,j,k,clock1,clear);
	jkff JK0(saida[5],porta,j,k,clock0,clear);
	
endmodule

module exercicio;
	reg clock;
	wire[5:0] saida;
	contador C(saida, clock, 0);
	initial begin
		clock = 1;
		#340 $finish;
	end
	always begin #5 clock=~clock; end
	always @(posedge clock) begin $display("%d %5b",$time,saida); end
endmodule
