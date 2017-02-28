// -------------------------
// Exercicio03
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module exercicio03;
	wire [7:0] s;
	reg [7:0] e;
	reg clear;
	reg rw;
	reg addr;
	wire clock; 
	
	clock clk(clock);
	
	ram1x8 RAM1(s, e, clock, rw, addr, clear);
	
	initial begin
		e = 8'b10101001;
		clear = 0;
		rw = 0;
		addr = 0;
		
		$display("Exercicio03 - Djonatas Tulio Rodrigues Costa - 440954");
		
		$display("\nclk rw   Addr  Entrada        Saida");
		$monitor("%b   %b    %b     %b       %b", clock, rw, addr, e, s);
		
		clear = 1;
		clear = 0;
		#5 rw = 1; addr = 1;
		#5 rw = 0;
		//#25 addr = 1; e = 8'b11100111; rw = 1;
		//#5 rw = 0;
		#20 $finish;

	end
endmodule // exercicio03