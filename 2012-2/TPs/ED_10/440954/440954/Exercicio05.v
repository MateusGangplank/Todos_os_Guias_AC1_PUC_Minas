// -------------------------
// Exercicio05
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

`include "diversos.v"

module exercicio05;
	wire [7:0] s;
	reg [7:0] e;
	reg clear;
	reg rw;
	reg [2:0]addr;
	wire clock; 
	
	clock clk(clock);
	
	ram8x8 RAM1(s, e, clock, rw, addr, clear);
	
	initial begin
		e = 8'b00000000;
		clear = 0;
		rw = 0;
		addr = 00;
		
		$display("Exercicio05 - Djonatas Tulio Rodrigues Costa - 440954");
		
		$display("\nclk rw   Addr    Entrada        Saida");
		$monitor("%b   %b    %b     %b       %b", clock, rw, addr, e, s);
		
		clear = 1;
		clear = 0;
		#5 rw = 1; addr = 000;
		#5 rw = 0;
		#5 rw = 1; addr = 001; e = 8'b00000001;
		#5 rw = 0;
		#5 rw = 1; addr = 010; e = 8'b00000010;
		#5 rw = 0;
		#5 rw = 1; addr = 011; e = 8'b00000011;
		#5 rw = 0; 
		#5 rw = 1; addr = 100; e = 8'b00000100;
		#5 rw = 0; 
		#5 rw = 1; addr = 101; e = 8'b00000101;
		#5 rw = 0; 
		#5 rw = 1; addr = 110; e = 8'b00000110;
		#5 rw = 0; 
		#5 rw = 1; addr = 111; e = 8'b00000111;
		#5 rw = 0; $finish;
		
	end
endmodule // exercicio05