// -------------------------
// Exercicio02
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module exercicio02;
	wire [3:0] s;
	reg [3:0] e;
	reg clear;
	reg rw;
	reg addr;
	wire clock; 
	
	clock clk(clock);
	
	ram2x4 RAM1(s, e, clock, rw, addr, clear);
	
	initial begin
		e = 4'b1010;
		clear = 0;
		rw = 0;
		addr = 0;
		
		$display("Exercicio02 - Djonatas Tulio Rodrigues Costa - 440954");
		
		$display("\nclk rw   Addr  Entrada    Saida");
		$monitor("%b   %b    %b     %b       %b", clock, rw, addr, e, s);
		
		clear = 1;
		clear = 0;
		#5 rw = 1; addr = 0;
		#5 rw = 0;
		#15 addr = 1; e = 4'b1001; rw = 1;
		#5 rw = 0;
		#20 $finish;

	end
endmodule // exercicio02