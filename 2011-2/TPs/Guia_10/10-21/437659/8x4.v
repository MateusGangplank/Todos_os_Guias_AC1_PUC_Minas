`include "mux.v"
`include "demux.v"
`include "1x1.v"

module  teste;
reg entrada[0:7], clk, rw, addr[0:4], clear;
wire saida[0:7], q[0:7], qnot[0:7], e[0:4];

demux demux1(e[0], 1, addr[0]);
demux demux2(e[1], 1, addr[1]);
demux demux3(e[2], 1, addr[2]);
demux demux4(e[3], 1, addr[3]);

mem_1por1 mem1(entrada[0], clk, e[0], clear, saida[0], q[0], qnot[0]);
mem_1por1 mem2(entrada[1], clk, e[0], clear, saida[1], q[1], qnot[1]);
mem_1por1 mem3(entrada[2], clk, e[0], clear, saida[2], q[2], qnot[2]);
mem_1por1 mem4(entrada[3], clk, e[0], clear, saida[3], q[3], qnot[3]);
mem_1por1 mem5(entrada[4], clk, e[0], clear, saida[4], q[4], qnot[4]);
mem_1por1 mem6(entrada[5], clk, e[0], clear, saida[5], q[5], qnot[5]);
mem_1por1 mem7(entrada[6], clk, e[0], clear, saida[6], q[6], qnot[6]);
mem_1por1 mem8(entrada[7], clk, e[0], clear, saida[7], q[7], qnot[7]);

mem_1por1 mem9(entrada[0], clk, e[1], clear, saida[0], q[0], qnot[0]);
mem_1por1 mem10(entrada[1], clk, e[1], clear, saida[1], q[1], qnot[1]);
mem_1por1 mem11(entrada[2], clk, e[1], clear, saida[2], q[2], qnot[2]);
mem_1por1 mem12(entrada[3], clk, e[1], clear, saida[3], q[3], qnot[3]);
mem_1por1 mem13(entrada[4], clk, e[1], clear, saida[4], q[4], qnot[4]);
mem_1por1 mem14(entrada[5], clk, e[1], clear, saida[5], q[5], qnot[5]);
mem_1por1 mem15(entrada[6], clk, e[1], clear, saida[6], q[6], qnot[6]);
mem_1por1 mem16(entrada[7], clk, e[1], clear, saida[7], q[7], qnot[7]);

mem_1por1 mem17(entrada[0], clk, e[2], clear, saida[0], q[0], qnot[0]);
mem_1por1 mem18(entrada[1], clk, e[2], clear, saida[1], q[1], qnot[1]);
mem_1por1 mem19(entrada[2], clk, e[2], clear, saida[2], q[2], qnot[2]);
mem_1por1 mem20(entrada[3], clk, e[2], clear, saida[3], q[3], qnot[3]);
mem_1por1 mem21(entrada[4], clk, e[2], clear, saida[4], q[4], qnot[4]);
mem_1por1 mem22(entrada[5], clk, e[2], clear, saida[5], q[5], qnot[5]);
mem_1por1 mem23(entrada[6], clk, e[2], clear, saida[6], q[6], qnot[6]);
mem_1por1 mem24(entrada[7], clk, e[2], clear, saida[7], q[7], qnot[7]);

mem_1por1 mem25(entrada[0], clk, e[3], clear, saida[0], q[0], qnot[0]);
mem_1por1 mem26(entrada[1], clk, e[3], clear, saida[1], q[1], qnot[1]);
mem_1por1 mem27(entrada[2], clk, e[3], clear, saida[2], q[2], qnot[2]);
mem_1por1 mem28(entrada[3], clk, e[3], clear, saida[3], q[3], qnot[3]);
mem_1por1 mem29(entrada[4], clk, e[3], clear, saida[4], q[4], qnot[4]);
mem_1por1 mem30(entrada[5], clk, e[3], clear, saida[5], q[5], qnot[5]);
mem_1por1 mem31(entrada[6], clk, e[3], clear, saida[6], q[6], qnot[6]);
mem_1por1 mem32(entrada[7], clk, e[3], clear, saida[7], q[7], qnot[7]);

initial 
	begin
	
		clk  = 0;
		clear  = 0;
		rw   = 0;
		addr[0] = 0;
		addr[1] = 0;
		addr[2] = 0;
		addr[3] = 1;
 
		
		entrada[0] = 0;
		entrada[1] = 0;
		entrada[2] = 1;
		entrada[3] = 0;
		entrada[4] = 1;
		entrada[5] = 1;
		entrada[6] = 1;
		entrada[7] = 1;
		
		$display ( "Memória 1x8 com Flip Flop JK" );
		$display ( "entrada\tclock\tADDR\tClear\tRW\tsaída" );
		
		rw   = 1;
		clk  = 1;
		
		#25 $finish;
		
	end
	
always 
  begin
  #5 clk = ~clk;
  end
		 
  	always @( clk )
  		begin
  			$display ( "%b%b%b%b%b%b%b%b\t%1b%1b%1b%1b\t%1b\t%1b\t%1b\t%b%b%b%b%b%b%b%b", entrada[0],entrada[1],entrada[2],entrada[3],entrada[4],entrada[5],entrada[6],entrada[7], clk, addr[0],addr[1],addr[2],addr[3], clear,rw,saida[0],saida[1],saida[2],saida[3],saida[4],saida[5],saida[6],saida[7] ); 
		end

endmodule