
// Exercicio 002 – Registrador de deslocamento para esquerda
// Nome: Átila Martins Silva Júnior
// Matricula: 449014

module clock ( clk );
	output clk;
	reg clk;
	initial
	begin
		clk = 1'b0;
	end
	always
	begin
		#12 clk = ~clk;
	end
endmodule

module dff ( output q, output qnot, input d, input preset, input clear, input clk );
	reg q, qnot;
	always @( posedge clk )
	begin
	if ( ~clear )
		begin
			q <= 0; qnot <= 1;
		end
	else
	if ( ~preset )
		begin
			q <= 1; qnot <= 0;
		end
	else
		begin
		if ( d )
			begin
				q <= d; qnot <= ~d;
			end
		end
	end
endmodule // dff

module regDesEsq2(output s4, output s3, output s2, output s1, output s0,
						 input clock, input clear, input ld, input[4:0] d);
	wire a0, a1, a2, a3, a4;
	and(a0,ld,d[0]);
	and(a1,ld,d[1]);
	and(a2,ld,d[2]);
	and(a3,ld,d[3]);
	and(a4,ld,d[4]);
	dff d1(s0,,0,a0,clear,clock);
	dff d2(s1,,s0,a1,clear,clock);
	dff d3(s2,,s1,a2,clear,clock);
	dff d4(s3,,s2,a3,clear,clock);
	dff d5(s4,,s3,a4,clear,clock);
	
endmodule

module testRegDesEsq2;
	
	reg ld;
	reg clear;
	reg[4:0] d;
	wire s0, s1, s2, s3, s4;
	wire clock;
	clock clk (clock);

	regDesEsq2 RDE2(s4, s3, s2, s1, s0,clock,clear,ld,d);
	
	always @( posedge clock )
	begin
	clear = 0;
	d = 5'b10001;
	ld = 1;
	end
	
	initial begin
	$dumpfile("exercicio002.vcd");
	$dumpvars(1,s0,s1,s2,s3,s4,clock);
	
	#480 $finish;
	end
	
endmodule