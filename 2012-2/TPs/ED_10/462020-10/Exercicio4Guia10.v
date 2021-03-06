// ---------------------------
// Exercicio4Guia10.v - Memoria ram com 4 modulos de memoria de 8 bits 1 endere�o
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// OBS: No enunciado n�o fica claro se � 2x8 ou 4x8, entao fiz
// 4 endere�os de 8 bits cada.
// ---------------------------
`include "clock.v"
// ---------------------------
// -- flip-flop jk
// ---------------------------
module jkff(output q, output qnot, input j, input k, input clk, input preset, input clear);
	reg q, qnot;
	always @( posedge clk ) begin
		if ( ~clear || ~j & k ) begin
			q <= 0; qnot <= 1;
		end
		else if ( ~preset || j & ~k )begin
			q <= 1; qnot <= 0;
		end
		else if ( j & k ) begin
			q <= ~q; qnot <= ~qnot;
		end
	end
endmodule
// ---------------------------
// -- Modulo de memoria de 1 bit
// ---------------------------
module bitMen(output saida, input addr, input rw, input clk, input clr, input j);
	wire clk2, q, qnot, k;
	reg prss;
	initial begin
		prss = 1'b1;
	end
	and A1(clk2,addr,rw,clk);
	not N1(k,j);
	jkff jk1(q,qnot,j,k,clk2,prss,clr);
	and A2(saida,addr,q);
endmodule
// ---------------------------
// -- Modulo de memoria de 4 bits, endere�ados por 1.
// ---------------------------
module men4b(output [3:0] saida, input addr, input rw, input clk, input clr, input [3:0] dt);
	bitMen bM1(saida[0],addr,rw,clk,clr,dt[0]);
	bitMen bM2(saida[1],addr,rw,clk,clr,dt[1]);
	bitMen bM3(saida[2],addr,rw,clk,clr,dt[2]);
	bitMen bM4(saida[3],addr,rw,clk,clr,dt[3]);
endmodule
// ---------------------------
// -- Memoria ram, 2 modulos de memoria de 4bits/1endere�o cada
// ---------------------------
module men4b2a(output [3:0] saida, input addr, input rw, input clk, input clr, input [3:0] dt);
        wire addr2;
        wire [3:0] saida1;
        wire [3:0] saida2;
        not N2(addr2,addr);
        men4b m4b1(saida1,addr2,rw,clk,clr,dt);
        men4b m4b2(saida2,addr,rw,clk,clr,dt);
        mux4b Mx1(saida,saida1,saida2,addr);
endmodule
// ---------------------------
// -- Mux para selecionar com 1 bit entre duas entradas de 4 bits
// ---------------------------
module mux4b(output [3:0] saida, input [3:0] p, input [3:0] q, input select);
        mux Mx2(saida[0],p[0],q[0],select);
        mux Mx3(saida[1],p[1],q[1],select);
        mux Mx4(saida[2],p[2],q[2],select);
        mux Mx5(saida[3],p[3],q[3],select);
endmodule
// ---------------------------
// -- Mux de um bit
// ---------------------------
module mux(output saida, input p, input q, input select);
        wire selectN;
        wire s1,s2;
        not N3(selectN,select);
        and A3(s1,p,selectN);
        and A4(s2,q,select);
        or O1(saida,s1,s2);
endmodule
// ---------------------------
// -- Demux, envia o valor do bit de entrada para a saida selecionada
// ---------------------------
module demux(output s1, output s2, input in, input select);
        wire selectN;
        not N4(selectN,select);
        and A5(s1,in,selectN);
        and A6(s2,in,select);
endmodule
// ---------------------------
// -- Memoria ram, 4 modulos de memoria de 8bits/1endere�o cada
// ---------------------------
module men8b4a(output [7:0] saida, input [1:0] addr, input rw, input clk, input clr, input [7:0] dt);
        wire rw1,rw2;
        wire [7:0] saida1;
        wire [7:0] saida2;
        demux d1(rw1,rw2,rw,addr[1]);
        men4b2a m421(saida1[3:0],addr[0],rw1,clk,clr,dt[3:0]);
        men4b2a m422(saida1[7:4],addr[0],rw1,clk,clr,dt[7:4]);
        men4b2a m423(saida2[3:0],addr[0],rw2,clk,clr,dt[3:0]);
        men4b2a m424(saida2[7:4],addr[0],rw2,clk,clr,dt[7:4]);
        mux4b Mx6(saida[3:0],saida1[3:0],saida2[3:0],addr[1]);
        mux4b Mx7(saida[7:4],saida1[7:4],saida2[7:4],addr[1]);
endmodule
// ---------------------------
// -- Teste do modulo de memoria de 8bits/1endere�o
// ---------------------------
module Exercicio4Guia10;
       wire clock;
       clock clk ( clock );
       wire [7:0] saida;
       reg [7:0] entrada;
       reg [1:0] addr;
       reg rw,clr;
       men8b4a m841(saida,addr,rw,clock,clr,entrada);
       initial begin
               $dumpfile ( "Exercicio4Guia10.vcd" );
               $dumpvars;
               addr = 2'b00; rw = 1'b1; clr = 1'b1; entrada = 8'b00000000;
           #15 clr = 1'b0;
           #30 rw = 1'b0;
           #40 entrada = 8'b10010101; clr = 1'b1;
           #40 rw = 1'b1;
           #50 rw = 1'b0;
           #50 addr = 2'b01;
          #100 entrada = 8'b00101001;
           #40 rw = 1'b1;
           #40 rw = 1'b0;
          #100 entrada = 8'b10101101;
           #50 addr = 2'b10;
          #100 entrada = 8'b01100001;
           #40 rw = 1'b1;
           #40 rw = 1'b0;
           #40 entrada = 8'b10000010;
           #40 rw = 1'b1;
           #50 rw = 1'b0;
           #40 entrada = 8'b00100011;
           #40 addr = 2'b11;
           #40 entrada = 8'b10011010;
           #40 rw = 1'b1;
           #50 rw = 1'b0;
           #40 addr = 2'b00;
           #40 addr = 2'b01;
           #40 addr = 2'b10;
           #40 addr = 2'b11;
           #40 addr = 2'b01;
           #40 addr = 2'b11;
          #480 $finish;
       end
endmodule