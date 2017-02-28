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

module leftRegister (output [4:0]s, input d, input clk);
wire nots;
wire d1, d2, d3, d4;
	
	ffd FF0 (s[0], nots, d, clk);

	or OR1 (d1, d, s[0]);
	ffd FF1 (s[1], nots, d1, clk);

	or OR2 (d2, d, s[1]);
   ffd FF2 (s[2], nots, d2, clk);

	or OR3 (d3, d, s[2]);
	ffd FF3 (s[3], nots, d3, clk);
	
	or OR4 (d4, d, s[3]);
	ffd FF4 (s[4], nots, d4, clk);
	
endmodule

module teste;
wire [4:0] saida;
reg d;
wire clock; 
clock clk ( clock ); 
leftRegister LF1 (saida, d, clock);
	
	initial begin
		$display("Guia08 - Gabriel Benjamim de Carvalho - 396690"); 
		$display("D CLOCK SAIDA");
		d = 1;
		$monitor("%1b    %1b    %5b", d, clock, saida);
		#23 d = 0;
		#120 $finish;
	end

endmodule 
