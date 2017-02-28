// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v"
`include "memoria.v"
 
// --------------------------- 
// -- Memoria 1x16
// --------------------------- 

module mem1x16a ( output[15:0] s, input addr,input rw, input[15:0] data, input clk, input clear ); 
	mem1x8 m1(s[7:0],addr,rw,data[7:0],clk,clear);
	mem1x8 m2(s[15:8],addr,rw,data[15:8],clk,clear);
endmodule

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire[15:0] saida;
	reg[15:0] data; 
	reg addr;
	reg rw;
	reg clear; 
	wire clock;
	
	clock c1(clock);
	mem1x16a M1x16 (saida,addr,rw,data,clock,clear);
			
	initial begin
		$display("CLK  ADDR RW ENTRADA   	       SAIDA");
		#1 clear = 1;
		#1 clear = 0;
		#1 rw = 0;
		#1 addr = 1;
		$monitor("%1b    %2b %4b %2b  %6b", clock, addr, rw, data, saida);
		data = 16'b0000111100001111;
		#1 rw = 1;
		#2 rw = 0;
		data = 16'b1111111100000000;
		#3 addr = 0;
		#3 addr = 1;
		#3 $finish;
	end
endmodule //teste