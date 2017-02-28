// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v"
`include "memoria.v"
 
// --------------------------- 
// -- Memoria 1x4
// --------------------------- 

module mem1x4a ( output[3:0] s, input addr,input rw, input[3:0] data, input clk, input clear ); 
	wire[1:0] w1,w2,w3;
	wire dontcare1;
	
	mem1x2 m1(s[1:0],addr,rw,data[1:0],clk,clear);
	mem1x2 m2(s[3:2],addr,rw,data[3:2],clk,clear);
endmodule

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire[3:0] saida;
	reg[3:0] data; 
	reg addr;
	reg rw;
	reg clear; 
	wire clock;
	
	clock c1(clock);
	mem1x4a M1x4 (saida,addr,rw,data,clock,clear);
			
	initial begin
		$display("CLK  ADDR RW ENTRADA   SAIDA");
		#1 clear = 1;
		#1 clear = 0;
		#1 addr = 0;
		#1 addr = 1;
		#1 rw = 0;
		$monitor("%1b    %2b %3b %6b      %6b", clock, addr, rw, data, saida);
		#1 data = 4'b0110;
		#1 rw = 1;
		#1 rw = 0;
		#1 data = 4'b1100;
		#2 rw = 1;
		#1 rw = 0;
		#5 addr = 0;
		#5 addr = 1;
		#7 $finish;
	end
endmodule //teste