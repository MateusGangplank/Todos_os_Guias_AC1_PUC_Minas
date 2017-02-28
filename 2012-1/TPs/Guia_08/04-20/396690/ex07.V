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


module rightShift (output [0:3]s, output [0:3]snot, input [0:3]data, input clk);
	wire w0,w1,w2,w3;
	
	or or0 (w0,data[0],snot[3]);
	or or1 (w1,data[1],s[0]);
	or or2 (w2,data[2],s[1]);
	or or3 (w3,data[3],s[2]);

	
	ffd FF0(s[0],snot[0],w0,clk);
	ffd FF1(s[1],snot[1],w1,clk);
	ffd FF2(s[2],snot[2],w2,clk);
	ffd FF3(s[3],snot[3],w3,clk);
	
endmodule 

module teste;
	reg [0:3]data;
	wire [0:3]s;
	wire [0:3]snot;
	wire clk;
	clock c1(clk);
	
	rightShift s1 (s,snot,data,clk);
	
	initial
		begin
			data = 4'b1111;
		end
	initial
		begin
		$display("Guia08 - Gabriel Benjamim de Carvalho - 396690"); 
		$display("\t\t Clk    Data   Output");
		#13 data = 4'b0000;
		#264 $finish;
		end
	always @(posedge clk)
		begin
			$display("%d	%b  %b",$time,data,s);
		end

endmodule 