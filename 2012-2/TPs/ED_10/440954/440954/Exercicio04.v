// -------------------------
// Exercicio04
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module exercicio04;
	wire [7:0] s;
	reg [7:0] e;
	reg clear;
	reg rw;
	reg [1:0]addr;
	wire clock; 
	
	clock clk(clock);
	
	ram2x8 RAM1(s, e, clock, rw, addr, clear);
	
	initial begin
		e = 8'b10101001;
		clear = 0;
		rw = 0;
		addr = 00;
		
		$display("Exercicio04 - Djonatas Tulio Rodrigues Costa - 440954");
		
		$display("\nclk rw   Addr   Entrada        Saida");
		$monitor("%b   %b    %b     %b       %b", clock, rw, addr, e, s);
		
		clear = 1;
		clear = 0;
		#5 rw = 1; addr = 00;
		#5 rw = 0;
		#5 rw = 1; addr = 01; e = 8'b11100111;
		#5 rw = 0;
		#5 rw = 1; addr = 10; e = 8'b00011000;
		#5 rw = 0;
		#5 rw = 1; addr = 11; e = 8'b01010101;
		#5 rw = 0; $finish;

	end
endmodule // exercicio04