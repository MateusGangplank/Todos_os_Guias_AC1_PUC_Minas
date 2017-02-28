// ---------------------------
// Exercicio1Guia10.v - Modulo de memoria de 4 bits 1 endereço
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
// -- Teste do modulo de memoria de 4bits
// ---------------------------
module Exercicio1Guia10;
       wire clock;
       clock clk ( clock );
       wire [3:0] saida;
       reg [3:0] entrada;
       reg addr,rw,clr;
       men4b m4b(saida,addr,rw,clock,clr,entrada);
       initial begin
               $dumpfile ( "Exercicio1Guia10.vcd" );
               $dumpvars;
               addr = 1'b1; rw = 1'b1; clr = 1'b1; entrada = 4'b0000;
           #15 clr = 1'b0;
           #30 rw = 1'b0; addr = 1'b0;
           #40 entrada = 4'b1010; clr = 1'b1; addr = 1'b1;
	   #10 entrada = 4'b1001;
           #20 rw = 1'b1;
          #100 entrada = 4'b1100;
          #450 rw = 1'b0;
           #40 entrada = 4'b0010;
           #10 addr = 1'b0;
           #60 addr = 1'b1;
           #30 addr = 1'b0;
          #480 $finish;
       end
endmodule