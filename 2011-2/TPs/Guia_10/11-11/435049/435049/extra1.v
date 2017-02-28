// ------------------------- 
// -------------------------
// Nome: Lorena Danielle Gonçalves Bento 
// Matricula: 435049
// ------------------------- 
// --------------------------- 
// -- extra1 
// ---------------------------



//--FlipFlop JK
module jkff ( output q, output qnot, input j, input k, input jclk ); 
	reg q, qnot; 
	always @( posedge jclk ) 
	begin 
		if ( j & ~k ) 
		begin 
		q <= 1; qnot <= 0; 
	end 
	else 
	if ( ~j & k ) 
		begin 
		q <= 0; qnot <= 1; 
		end 
	else 
		if ( j & k ) 
		begin 
		q <= ~q; qnot <= ~qnot; 
		end 
	end 
endmodule // jkff 
//--Fim FlipFlop


module  exerExtr (input in001, input clk, input addr, input clear, output s, output q, output qnot);
	and and0(clk_s, clk, rw, addr);
	jkff jk1 (q, qnot, in001, in001,clk_s);
	or or1(s, q, addr);
endmodule


module  teste;
reg in001[0:15], clk, rw, addr, clear;
wire s[0:15], q[0:15], qnot[0:15];

exerExtr ee1(in001[0], clk, addr, clear, s[0], q[0], qnot[0]);
exerExtr ee2(in001[1], clk, addr, clear, s[1], q[1], qnot[1]);
exerExtr ee3(in001[2], clk, addr, clear, s[2], q[2], qnot[2]);
exerExtr ee4(in001[3], clk, addr, clear, s[3], q[3], qnot[3]);
exerExtr ee5(in001[4], clk, addr, clear, s[4], q[4], qnot[4]);
exerExtr ee6(in001[5], clk, addr, clear, s[5], q[5], qnot[5]);
exerExtr ee7(in001[6], clk, addr, clear, s[6], q[6], qnot[6]);
exerExtr ee8(in001[7], clk, addr, clear, s[7], q[7], qnot[7]);
exerExtr ee9(in001[8], clk, addr, clear, s[8], q[8], qnot[8]);
exerExtr ee10(in001[9], clk, addr, clear, s[9], q[9], qnot[9]);
exerExtr ee11(in001[10], clk, addr, clear, s[10], q[10], qnot[10]);
exerExtr ee12(in001[11], clk, addr, clear, s[11], q[11], qnot[11]);
exerExtr ee13(in001[12], clk, addr, clear, s[12], q[12], qnot[12]);
exerExtr ee14(in001[13], clk, addr, clear, s[13], q[13], qnot[13]);
exerExtr ee15(in001[14], clk, addr, clear, s[14], q[14], qnot[14]);
exerExtr ee16(in001[15], clk, addr, clear, s[15], q[15], qnot[15]);

initial 
	begin
		clk  = 0; 		addr = 0;		clear  = 0;		rw   = 0;
		
		in001[0] = 1;		in001[1] = 0;		in001[2] = 1;		in001[3] = 0;
		in001[4] = 1;		in001[5] = 0;		in001[6] = 1;		in001[7] = 0;
		in001[8] = 1;		in001[9] = 0;		in001[10] = 1;		in001[11] = 0;
		in001[12] = 1;		in001[13] = 1;		in001[14] = 1;		in001[15] = 1;
		
		$display("Extra:"); 
      $display("Nome: Lorena Danielle Gonçalves Bento - 435049");
		
		addr = 1;		rw   = 1;		clk  = 1;
		
		#10 $finish;
		
	end
	
always 
  begin
  #5 clk = ~clk;
  end
		 
  	always @( clk )
  		begin
  			$display ( "%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b\t%1b\t%1b%1b%1b\t%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b%b", in001[0],in001[1],in001[2],in001[3],in001[4],
			in001[5],in001[6],in001[7],in001[8],in001[9],in001[10],in001[11],in001[12],in001[13],in001[14],in001[15], 
			clk, addr, clear,rw,
			s[0],s[1],s[2],s[3],s[4],s[5],s[6],s[7],s[8],s[9],s[10],s[11],s[12],s[13],s[14],s[15]); 
		end

endmodule