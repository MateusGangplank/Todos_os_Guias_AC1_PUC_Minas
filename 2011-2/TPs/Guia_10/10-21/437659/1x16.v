`include "1x1.v"

module  teste;
reg entrada[0:15], clk, rw, addr, clear;
wire saida[0:15], q[0:15], qnot[0:15];

mem_1por1 mem1(entrada[0], clk, addr, clear, saida[0], q[0], qnot[0]);
mem_1por1 mem2(entrada[1], clk, addr, clear, saida[1], q[1], qnot[1]);
mem_1por1 mem3(entrada[2], clk, addr, clear, saida[2], q[2], qnot[2]);
mem_1por1 mem4(entrada[3], clk, addr, clear, saida[3], q[3], qnot[3]);
mem_1por1 mem5(entrada[4], clk, addr, clear, saida[4], q[4], qnot[4]);
mem_1por1 mem6(entrada[5], clk, addr, clear, saida[5], q[5], qnot[5]);
mem_1por1 mem7(entrada[6], clk, addr, clear, saida[6], q[6], qnot[6]);
mem_1por1 mem8(entrada[7], clk, addr, clear, saida[7], q[7], qnot[7]);

mem_1por1 mem9(entrada[8], clk, addr, clear, saida[8], q[8], qnot[8]);
mem_1por1 mem10(entrada[9], clk, addr, clear, saida[9], q[9], qnot[9]);
mem_1por1 mem11(entrada[10], clk, addr, clear, saida[10], q[10], qnot[10]);
mem_1por1 mem12(entrada[11], clk, addr, clear, saida[11], q[11], qnot[11]);
mem_1por1 mem13(entrada[12], clk, addr, clear, saida[12], q[12], qnot[12]);
mem_1por1 mem14(entrada[13], clk, addr, clear, saida[13], q[13], qnot[13]);
mem_1por1 mem15(entrada[14], clk, addr, clear, saida[14], q[14], qnot[14]);
mem_1por1 mem16(entrada[15], clk, addr, clear, saida[15], q[15], qnot[15]);

initial 
	begin
	
		clk  = 0;
		addr = 0;
		clear  = 0;
		rw   = 0;
		
		entrada[0] = 0;
		entrada[1] = 0;
		entrada[2] = 1;
		entrada[3] = 0;
		entrada[4] = 1;
		entrada[5] = 1;
		entrada[6] = 1;
		entrada[7] = 1;
		entrada[8] = 0;
		entrada[9] = 0;
		entrada[10] = 1;
		entrada[11] = 0;
		entrada[12] = 0;
		entrada[13] = 0;
		entrada[14] = 0;
		entrada[15] = 1;
		
		$display ( "Memória 1x16 com Flip Flop JK" );
		$display ( "entrada\t\t\tclock\tADDR\tClear\tRW\t\tsaída" );
		
		addr = 1;
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
  			$display ( "%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b\t%1b\t%1b\t%1b\t%1b\t%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b", entrada[0],entrada[1],entrada[2],entrada[3],entrada[4],entrada[5],entrada[6],entrada[7],entrada[8],entrada[9],entrada[10],entrada[11],entrada[12],entrada[13],entrada[14],entrada[15], clk, addr, clear,rw,saida[0],saida[1],saida[2],saida[3],saida[4],saida[5],saida[6],saida[7],saida[8],saida[9],saida[10],saida[11],saida[12],saida[13],saida[14],saida[15] ); 
		end

endmodule