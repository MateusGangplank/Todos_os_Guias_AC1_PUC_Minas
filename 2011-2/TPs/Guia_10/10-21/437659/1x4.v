`include "1x1.v"

module  teste_mem14;
reg entrada[0:3], clk, rw, addr, clear;
wire saida[0:3], q[0:3], qnot[0:3];

mem_1por1 mem1(entrada[0], clk, addr, clear, saida[0], q[0], qnot[0]);
mem_1por1 mem2(entrada[1], clk, addr, clear, saida[1], q[1], qnot[1]);
mem_1por1 mem3(entrada[2], clk, addr, clear, saida[2], q[2], qnot[2]);
mem_1por1 mem4(entrada[3], clk, addr, clear, saida[3], q[3], qnot[3]);

initial 
	begin
	
		clk  = 0;
		addr = 0;
		clear  = 0;
		rw   = 0;
		
		entrada[0] = 1;
		entrada[1] = 0;
		entrada[2] = 1;
		entrada[3] = 0;
		
		$display ( "Memória 1x4 com Flip Flop JK" );
		$display ( "entrada\tclock\tADDR\tClear\tRW\tsaída" );
		
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
  			$display ( "%b%b%b%b\t%1b\t%1b\t%1b\t%1b\t%b%b%b%b", entrada[0],entrada[1],entrada[2],entrada[3], clk, addr, clear,rw,saida[0],saida[1],saida[2],saida[3] ); 
		end

endmodule