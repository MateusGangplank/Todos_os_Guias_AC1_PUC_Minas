// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v"
`include "memoria.v"
 
// --------------------------- 
// -- Memoria 1x8
// --------------------------- 

module mem1x8a ( output[7:0] s, input addr,input rw, input[7:0] data, input clk, input clear ); 
	mem1x4 m1(s[3:0],addr,rw,data[3:0],clk,clear);
	mem1x4 m2(s[7:4],addr,rw,data[7:4],clk,clear);
endmodule

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire[7:0] saida;
	reg[7:0] data; 
	reg addr;
	reg rw;
	reg clear; 
	wire clock;
	
	clock c1(clock);
	mem1x8a M1x8 (saida,addr,rw,data,clock,clear);
			
	initial begin
		$display("CLK  ADDR RW ENTRADA   SAIDA");
		#1 clear = 1;
		#1 clear = 0;
		#1 rw = 0;
		#1 addr = 1;
		$monitor("%1b    %2b %4b %2b  %6b", clock, addr, rw, data, saida);
		data = 8'b11110110;
		#1 rw = 1;
		#1 rw = 0;
		data = 8'b00101100;
		#1 rw = 1;
		#1 rw = 0;
		#5 addr = 0;
		#5 addr = 1;
		#3 $finish;
	end
endmodule //teste