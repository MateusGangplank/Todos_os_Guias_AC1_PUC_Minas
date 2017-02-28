// ---------------------------
// Exercicio3Guia10.v - Modulo de memoria de 8 bits 1 endereço
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
// -- Modulo de memoria de 8bits/1endereço
// ---------------------------
module men8b(output [7:0] saida, input addr, input rw, input clk, input clr, input [7:0] dt);
        men4b m4b1(saida[3:0],addr,rw,clk,clr,dt[3:0]);
        men4b m4b2(saida[7:4],addr,rw,clk,clr,dt[7:4]);
endmodule
// ---------------------------
// -- Teste do modulo de memoria de 8bits/1endereço
// ---------------------------
module Exercicio3Guia10;
       wire clock;
       clock clk ( clock );
       wire [7:0] saida;
       reg [7:0] entrada;
       reg addr,rw,clr;
       men8b m8b1(saida,addr,rw,clock,clr,entrada);
       initial begin
               $dumpfile ( "Exercicio3Guia10.vcd" );
               $dumpvars;
               addr = 1'b1; rw = 1'b1; clr = 1'b1; entrada = 8'b00000000;
           #15 clr = 1'b0;
           #30 rw = 1'b0;
           #40 entrada = 8'b10010101; clr = 1'b1;
           #40 rw = 1'b1;
           #50 rw = 1'b0;
           #50 addr = 1'b0;
          #100 entrada = 8'b00101001;
          #450 addr = 1'b1;
           #40 entrada = 8'b10000010;
           #40 rw = 1'b1;
           #50 rw = 1'b0;
           #40 entrada = 8'b00100011;
           #40 addr = 1'b0;
           #40 addr = 1'b1;
           #40 addr = 1'b0;
          #480 $finish;
       end
endmodule