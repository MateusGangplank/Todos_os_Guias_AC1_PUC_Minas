// ------------------------- 
// Guia08 - Registrador de Deslocamento
// Nome: Gabriel Benjamim de Carvalho 
// Matricula: 396690
// ------------------------- 

`include "clock.v"


module ffd(q,qnot,data,clk);
	output q;
	output qnot;
	input data;
	input clk;
	
	reg q,qnot;
	
	initial begin
		q = 1'b0;
		qnot = 1'b1;
	end
	always @ (posedge clk)
		begin
		q <= data;	qnot <= ~q;
		end
			
endmodule 

module rotateLeftRegister (output [3:0]s, input d, input clk);
wire nots;	
	
	or OR1 (d0, d, s[3]);
	
	ffd FF0 (s[0], nots, d0, clk);
	ffd FF1 (s[1], nots, s[0], clk);
	ffd FF2 (s[2], nots, s[1], clk);
	ffd FF3 (s[3], nots, s[2], clk);

	
endmodule

module teste;
wire [3:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
rotateLeftRegister RLF1 (saida, d, clock);
	
	initial begin
		$display("Guia08 - Gabriel Benjamim de Carvalho - 396690"); 
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %5b", d, clock, saida);
		#23 d = 0;
		#240 $finish;
	end

endmodule 
