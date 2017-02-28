// -------------------------
// Nome: Marcio Enio Gonçalves Dutra Junior
// Matricula: 441698
// -------------------------

`include "clock.v"
`include "memoria.v"
 
// --------------------------- 
// -- Memoria 8x8
// --------------------------- 

module mem8x8a ( output[7:0] s, input[2:0] addr,input rw, input[7:0] data, input clk, input clear ); 
	wire w1,w2,w3,w4;
	wire[7:0] s1,s2;
	
	and (w1, addr[2], 1);
	and (w2, ~addr[2], 1);
	and (w3, rw, w1);
	and (w4, rw, w2);

	mem4x8 m1(s1[7:0],addr[1:0],w3,data[7:0],clk,clear);
	mem4x8 m2(s2[7:0],addr[1:0],w4,data[7:0],clk,clear);
	
	assign s = w1? s1: w2? s2: 8'bxxxxxxxx;
endmodule

// -------------------------
// -- Teste
// -------------------------
module teste;
	wire[7:0] saida;
	reg[7:0] data; 
	reg[2:0] addr;
	reg rw;
	reg clear; 
	wire clock;
	
	clock c1(clock);
	mem8x8a M8x8 (saida,addr,rw,data,clock,clear);
			
	initial begin
		$display("CLK  ADDR RW ENTRADA   SAIDA");
		#1 clear = 1;
		#1 clear = 0;
		#1 rw = 0;
		#1 addr = 3'b000;
		$monitor("%1b    %2b %4b %2b  %6b", clock, addr, rw, data, saida);
		data = 8'b00000001;
		#1 rw = 1;
		#2 rw = 0;
		#1 addr = 3'b001;
		data = 8'b00000010;
		#1 rw = 1;
		#2 rw = 0;
		#5 addr = 3'b010;
		data = 8'b00000011;
		#1 rw = 1;
		#2 rw = 0;
		#5 addr = 3'b011;
		data = 8'b00000100;
		#1 rw = 1;
		#2 rw = 0;
		#5 addr = 3'b100;
		data = 8'b00000101;
		#1 rw = 1;
		#2 rw = 0;
		#5 addr = 3'b101;
		data = 8'b00000110;
		#1 rw = 1;
		#2 rw = 0;
		#5 addr = 3'b110;
		data = 8'b00000111;
		#1 rw = 1;
		#2 rw = 0;
		#5 addr = 3'b111;
		data = 8'b00001000;
		#1 rw = 1;
		#2 rw = 0;
		#3 addr = 3'b000;
		#3 addr = 3'b001;
		#3 addr = 3'b010;
		#3 addr = 3'b011;
		#3 addr = 3'b100;
		#3 addr = 3'b101;
		#3 addr = 3'b110;
		#3 addr = 3'b111;
		#3 $finish;
	end
endmodule //teste