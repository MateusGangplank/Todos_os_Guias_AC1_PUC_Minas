// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v"
`include "memoria.v"
 
// --------------------------- 
// -- Memoria 4x8
// --------------------------- 

module mem4x8a ( output[7:0] s, input[1:0] addr,input rw, input[7:0] data, input clk, input clear ); 
	wire w1,w2,w3,w4,w5,w6,w7,w8;
	wire[7:0] s1,s2,s3,s4;
	
	and (w1, addr[0], 1);
	and (w2, addr[1], 1);
	and (w3, ~addr[0], 1);
	and (w4, ~addr[1], 1);
	
	and (w5, w3, w4);
	and (w6, w3, w2);
	and (w7, w1, w4);
	and (w8, w1, w2);

	mem1x8 m1(s1[7:0],w5,rw,data[7:0],clk,clear);
	mem1x8 m2(s2[7:0],w6,rw,data[7:0],clk,clear);
	mem1x8 m3(s3[7:0],w7,rw,data[7:0],clk,clear);
	mem1x8 m4(s4[7:0],w8,rw,data[7:0],clk,clear);
	
	assign s = w5? s1: w6? s2: w7? s3: w8? s4: 8'bxxxxxxxx;
endmodule

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire[7:0] saida;
	reg[7:0] data; 
	reg[1:0] addr;
	reg rw;
	reg clear; 
	wire clock;
	
	clock c1(clock);
	mem4x8a M4x8 (saida,addr,rw,data,clock,clear);
			
	initial begin
		$display("CLK  ADDR RW ENTRADA   SAIDA");
		#1 clear = 1;
		#1 clear = 0;
		#1 rw = 0;
		#1 addr = 2'b00;
		$monitor("%1b    %2b %4b %2b  %6b", clock, addr, rw, data, saida);
		data = 8'b00000001;
		#1 rw = 1;
		#2 rw = 0;
		#1 addr = 2'b01;
		data = 8'b00000010;
		#1 rw = 1;
		#2 rw = 0;
		#1 addr = 2'b10;
		data = 8'b00000011;
		#1 rw = 1;
		#2 rw = 0;
		#1 addr = 2'b11;
		data = 8'b00000100;
		#1 rw = 1;
		#2 rw = 0;
		#3 addr = 2'b00;
		#3 addr = 2'b01;
		#3 addr = 2'b10;
		#3 addr = 2'b11;
		#3 $finish;
	end
endmodule //teste