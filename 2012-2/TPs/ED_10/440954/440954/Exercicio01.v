// -------------------------
// Exercicio01
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module exercicio01;
	wire [3:0] s;
	reg [3:0] e;
	reg clear;
	reg rw;
	reg addr;
	wire clock; 
	
	clock clk(clock);
	
	ram1x4 RAM1(s, e, clock, rw, addr, clear);
	
	initial begin
		e = 4'b1010;
		clear = 0;
		rw = 0;
		addr = 0;
		
		$display("Exercicio01 - Djonatas Tulio Rodrigues Costa - 440954");
		
		$display("\nclk rw   Entrada    Saida");
		$monitor("%b   %b    %b       %b", clock, rw, e, s);
		
		clear = 1;
		clear = 0;
		#5 rw = 1; addr = 1;
		#5 rw = 0;
		#15 $finish;

	end
endmodule // exercicio01