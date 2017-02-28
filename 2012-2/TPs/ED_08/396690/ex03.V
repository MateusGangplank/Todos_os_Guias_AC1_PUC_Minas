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

module rightRegister (output [4:0]s, input d, input clk);
wire nots;	
	
	ffd FF0 (s[4], nots, d, clk);
	ffd FF1 (s[3], nots, s[4], clk);
	ffd FF2 (s[2], nots, s[3], clk);
	ffd FF3 (s[1], nots, s[2], clk);
	ffd FF4 (s[0], nots, s[1], clk);
	
endmodule


module teste;
wire [4:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
rightRegister RF1 (saida, d, clock);
	
	initial begin
		$display("Guia08 - Gabriel Benjamim de Carvalho - 396690"); 
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %5b", d, clock, saida);
		#23 d = 0;
		#120 $finish;
	end

endmodule 
