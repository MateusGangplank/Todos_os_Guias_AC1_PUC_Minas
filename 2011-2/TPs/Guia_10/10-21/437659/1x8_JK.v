`include "FFJK.V"

module  teste1por8;
reg entrada[0:7], clk, rw, addr, clear;
wire saida[0:7], q[0:7], qnot[0:7], clk_s;

and and0(clk_s, clk, rw, addr);

jkff jk1 (q[0], qnot[0], entrada[0], entrada[0],clk_s);
jkff jk2 (q[1], qnot[0], entrada[1], entrada[1],clk_s);
jkff jk3 (q[2], qnot[0], entrada[2], entrada[2],clk_s);
jkff jk4 (q[3], qnot[0], entrada[3], entrada[3],clk_s);

jkff jk5 (q[4], qnot[0], entrada[4], entrada[4],clk_s);
jkff jk6 (q[5], qnot[0], entrada[5], entrada[5],clk_s);
jkff jk7 (q[6], qnot[0], entrada[6], entrada[6],clk_s);
jkff jk8 (q[7], qnot[0], entrada[7], entrada[7],clk_s);

and and1(saida[0], q[0], addr);
and and2(saida[1], q[1], addr);
and and3(saida[2], q[2], addr);
and and4(saida[3], q[3], addr);

and and5(saida[4], q[4], addr);
and and6(saida[5], q[5], addr);
and and7(saida[6], q[6], addr);
and and8(saida[7], q[7], addr);

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
		
		$display ( "Memória 1x8 com Flip Flop JK" );
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
  			$display ( "%b%b%b%b%b%b%b%b\t%1b\t%1b\t%1b\t%1b\t%b%b%b%b%b%b%b%b", entrada[0],entrada[1],entrada[2],entrada[3],entrada[4],entrada[5],entrada[6],entrada[7], clk_s, addr, clear,rw,saida[0],saida[1],saida[2],saida[3],saida[4],saida[5],saida[6],saida[7] ); 
		end

endmodule