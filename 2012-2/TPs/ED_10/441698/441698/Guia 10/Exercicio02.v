// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v"
`include "memoria.v"
 
// --------------------------- 
// -- Memoria 2x4
// --------------------------- 

module mem2x4a ( output[3:0] s, input addr,input rw, input[3:0] data, input clk, input clear ); 
	wire w1,w2,w3;
	wire[3:0] s1,s2;
	
	not(w3, addr);
	and a1(w1, addr, 1);
	and a2(w2, w3, 1);
	
	mem1x4 m1(s1,w1,rw,data[3:0],clk,clear);
	mem1x4 m2(s2,w2,rw,data[3:0],clk,clear);
	
	assign s = addr? s1:s2;
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
	mem2x4a M2x4 (saida,addr,rw,data,clock,clear);
			
	initial begin
		$display("CLK  ADDR RW ENTRADA   SAIDA");
		#1 clear = 1;
		#1 clear = 0;
		#1 rw = 0;
		#1 addr = 0;
		$monitor("%1b    %2b %3b %5b      %3b", clock, addr, rw, data, saida);
		data = 4'b0110;
		#1 rw = 1;
		#1 rw = 0;
		addr = 1;
		data = 4'b1100;
		#1 rw = 1;
		#1 rw = 0;
		#5 addr = 0;
		#5 addr = 1;
		#3 $finish;
	end
endmodule //teste