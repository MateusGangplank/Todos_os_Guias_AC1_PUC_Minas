`include "FFJK.V"
module  teste;
reg entrada[0:3], clk, rw, addr, clear;
wire saida[0:3], q[0:3], qnot[0:3], clk_s;

and and0(clk_s, clk, rw, addr);

jkff jk1 (q[0], qnot[0], entrada[0], entrada[0],clk_s);
jkff jk2 (q[1], qnot[0], entrada[1], entrada[1],clk_s);
jkff jk3 (q[2], qnot[0], entrada[2], entrada[2],clk_s);
jkff jk4 (q[3], qnot[0], entrada[3], entrada[3],clk_s);

and and1(saida[0], q[0], addr);
and and2(saida[1], q[1], addr);
and and3(saida[2], q[2], addr);
and and4(saida[3], q[3], addr);

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
  			$display ( "%b%b%b%b\t%1b\t%1b\t%1b\t%1b\t%b%b%b%b", entrada[0],entrada[1],entrada[2],entrada[3], clk_s, addr, clear,rw,saida[0],saida[1],saida[2],saida[3] ); 
		end

endmodule