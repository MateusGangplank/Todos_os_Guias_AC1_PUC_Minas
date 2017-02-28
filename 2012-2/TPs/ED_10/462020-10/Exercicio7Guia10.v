// ---------------------------
// Exercicio7Guia10.v - Memoria ram com 4 modulos de memoria de 8 bits 1 endereço
// Nome: Willian Antonio dos Santos
// Matricula: 462020
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
// -- Mux para selecionar com 1 bit entre duas entradas de 8 bits
// ---------------------------
module mux8b(output [7:0] saida, input [7:0] p, input [7:0] q, input select);
        mux4b Mx41(saida[3:0],p[3:0],q[3:0],select);
        mux4b Mx42(saida[7:4],p[7:4],q[7:4],select);
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
module demux(output s1, output s2, output s3, output s4, input in, input [1:0] select);
        wire [1:0] selectN;
        not N4(selectN[0],select[0]);
        not N5(selectN[1],select[1]);
        and A5(s1,in,selectN[1],selectN[0]);
        and A6(s2,in,selectN[1],select[0]);
        and A7(s3,in,select[1],selectN[0]);
        and A8(s4,in,select[1],select[0]);
endmodule
// ---------------------------
// -- Modulo de memoria de 4 bits, endereçados por 1.
// ---------------------------
module men4b(output [3:0] saida, input addr, input rw, input clk, input clr, input [3:0] dt);
	bitMen bM1(saida[0],addr,rw,clk,clr,dt[0]);
	bitMen bM2(saida[1],addr,rw,clk,clr,dt[1]);
	bitMen bM3(saida[2],addr,rw,clk,clr,dt[2]);
	bitMen bM4(saida[3],addr,rw,clk,clr,dt[3]);
endmodule
// ---------------------------
// -- Modulo de memoria de 8bits/1endereço
// ---------------------------
module men8b(output [7:0] saida, input addr, input rw, input clk, input clr, input [7:0] dt);
        men4b m4b1(saida[3:0],addr,rw,clk,clr,dt[3:0]);
        men4b m4b2(saida[7:4],addr,rw,clk,clr,dt[7:4]);
endmodule
// ---------------------------
// -- Memoria ram, com 4 modulos de memoria de 8bits/1endereço
// ---------------------------
module men8b4a(output [7:0] saida, input [1:0] addr, input rw, input clk, input clr, input [7:0] dt);
        wire [7:0] saida1, saida2, saida3, saida4, saida5, saida6;
        wire addr1, addr2, addr3, addr4;
        demux d1(addr1, addr2, addr3, addr4, 1'b1, addr);
        men8b m8b1(saida1[7:0],addr1,rw,clk,clr,dt[7:0]);
        men8b m8b2(saida2[7:0],addr2,rw,clk,clr,dt[7:0]);
        men8b m8b3(saida3[7:0],addr3,rw,clk,clr,dt[7:0]);
        men8b m8b4(saida4[7:0],addr4,rw,clk,clr,dt[7:0]);
        mux8b Mx81(saida5,saida1,saida2,addr[0]);
        mux8b Mx82(saida6,saida3,saida4,addr[0]);
        mux8b Mx83(saida,saida5,saida6,addr[1]);
endmodule
// ---------------------------
// -- Teste do modulo de memoria de 8bits/1endereço
// ---------------------------
module Exercicio7Guia10;
       wire clock;
       clock clk ( clock );
       wire [7:0] saida;
       reg [7:0] entrada;
       reg [1:0] addr;
       reg rw,clr;
       men8b4a m841(saida,addr,rw,clock,clr,entrada);
       initial begin
               $dumpfile ( "Exercicio7Guia10.vcd" );
               $dumpvars(1, clock, rw, clr, addr, entrada, saida);
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