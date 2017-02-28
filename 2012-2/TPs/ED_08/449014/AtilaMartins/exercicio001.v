
// Exercicio 001 – Registrador de deslocamento para esquerda
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

module dff ( output q, output qnot, input d, input clk );
	reg q, qnot;
	always @( posedge clk )
	begin
		q <= d; qnot <= ~d;
	end
endmodule // dff

module regDesEsq(output a, output b, output c, output d, output e, 
					  input data, input clock);
	dff c0(e,,data,clock);
	dff c1(d,,e,clock);
	dff c2(c,,d,clock);
	dff c3(b,,c,clock);
	dff v4(a,,b,clock);
		
endmodule

module testRegDesEsq;

	reg data;
	wire clock;
	clock clk (clock);

	regDesEsq RDE(a,b,c,d,e,data,clock);
	
	always @( posedge clock )
	begin
	data = 1'b0;
	#4 data = 1'b1;
	#4 data = 1'b1;
	#4 data = 1'b0;
	#4 data = 1'b1;
	#4 data = 1'b1;
	#4 data = 1'b1;
	#4 data = 1'b0;
	#4 data = 1'b0;
	end

	
	initial begin
	$dumpfile("exercicio001.vcd");
	$dumpvars(clock,data,a,b,c,d,e);
	
	#480 $finish;
	end
	
endmodule