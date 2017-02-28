// ---------------------------
// Exercicio2Guia10.v - 2 Modulos de memoria de 4 bits 1 endereço cada
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
// -- Modulo de memoria de 4 bits, endereçados por 1.
// ---------------------------
module men4b(output [3:0] saida, input addr, input rw, input clk, input clr, input [3:0] dt);
	bitMen bM1(saida[0],addr,rw,clk,clr,dt[0]);
	bitMen bM2(saida[1],addr,rw,clk,clr,dt[1]);
	bitMen bM3(saida[2],addr,rw,clk,clr,dt[2]);
	bitMen bM4(saida[3],addr,rw,clk,clr,dt[3]);
endmodule
// ---------------------------
// -- Memoria ram, 2 modulos de memoria de 4bits/1endereço cada
// ---------------------------
module menRam(output [3:0] saida, input addr, input rw, input clk, input clr, input [3:0] dt);
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
// -- Teste do 2 modulos de memoria de 4bits/1endereço
// ---------------------------
module Exercicio2Guia10;
       wire clock;
       clock clk ( clock );
       wire [3:0] saida;
       reg [3:0] entrada;
       reg addr,rw,clr;
       menRam mRm1(saida,addr,rw,clock,clr,entrada);
       initial begin
               $dumpfile ( "Exercicio2Guia10.vcd" );
               $dumpvars;
               addr = 1'b0; rw = 1'b1; clr = 1'b1; entrada = 4'b0000;
           #15 clr = 1'b0;
           #30 rw = 1'b0;
           #40 entrada = 4'b1010; clr = 1'b1;
           #40 rw = 1'b1;
           #50 rw = 1'b0;
          #100 entrada = 4'b1100;
          #450 addr = 1'b1;
           #40 entrada = 4'b0010;
           #40 rw = 1'b1;
           #50 rw = 1'b0;
           #40 entrada = 4'b1011;
           #40 addr = 1'b0;
           #40 addr = 1'b1;
           #40 addr = 1'b0;
          #480 $finish;
       end
endmodule