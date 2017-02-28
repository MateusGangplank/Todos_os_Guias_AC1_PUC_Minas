// *****************************
// Isabel Bicalho Amaro
// Matricula: 451580
// *****************************

   module jkff ( output q, output qnot, input j, input k, input clk );
      reg q = 0, qnot = 1;

      always @( posedge clk )
      begin

         if ( j & ~k )
         begin
            q <= 1; qnot <= 0;
         end

         else if ( ~j & k )
         begin
            q <= 0; qnot <= 1;
         end

         else if ( j & k )
         begin
            q <= ~q; qnot <= ~qnot;
         end
      end
  endmodule // jkff
  
  
  module memoria( output s, input addr, input rw, input clk, input i);
     wire a1,a2,a2n,ni;
	  
	  not not1(ni,i);
	  and and1(a1,addr,rw,clk);
	  jkff jk1(a2,a2n,i,ni,a1);
	  and and2(s,addr,a2);
  endmodule // memoria
  
  
  module questao1( output[3:0]s, input addr, input rw, input clk, input[3:0]i );	  
	  memoria m1(s[0],addr,rw,clk,i[0]);
	  memoria m2(s[1],addr,rw,clk,i[1]);
	  memoria m3(s[2],addr,rw,clk,i[2]);
	  memoria m4(s[3],addr,rw,clk,i[3]);
  endmodule // questao1
  
  
  module teste;
  
  reg addr,rw,clk;
  reg[3:0]i;
  wire[3:0]s;
  
  questao1 q1(s,addr,rw,clk,i);
  
     initial begin
        clk = 0; i = 4'b1010; addr = 0; rw = 0;
		  #2 rw = 1; addr = 1;
		  #2 rw = 0;
		  #20 $finish;
     end
	  
	  always begin
		  #4addr = ~addr;
	  end
		  
	  always begin
	     #1 clk = ~clk;
	  end
	  
	  always @(clk)begin
	     $display("clk %b  addr %b  rw %b  in %4b  out %4b",clk,addr,rw,i,s);
	  end
  endmodule

/*

    clk 0  addr 0  rw 0  in 1010  out 0000
    clk 1  addr 0  rw 0  in 1010  out 0000
    clk 0  addr 1  rw 1  in 1010  out 0000
    clk 1  addr 1  rw 1  in 1010  out 0000
    clk 0  addr 0  rw 0  in 1010  out 0000
    clk 1  addr 0  rw 0  in 1010  out 0000
    clk 0  addr 0  rw 0  in 1010  out 0000
    clk 1  addr 0  rw 0  in 1010  out 0000
    clk 0  addr 1  rw 0  in 1010  out 1010
    clk 1  addr 1  rw 0  in 1010  out 1010
    clk 0  addr 1  rw 0  in 1010  out 1010
    clk 1  addr 1  rw 0  in 1010  out 1010
    clk 0  addr 0  rw 0  in 1010  out 0000
    clk 1  addr 0  rw 0  in 1010  out 0000
    clk 0  addr 0  rw 0  in 1010  out 0000
    clk 1  addr 0  rw 0  in 1010  out 0000
    clk 0  addr 1  rw 0  in 1010  out 1010
    clk 1  addr 1  rw 0  in 1010  out 1010
    clk 0  addr 1  rw 0  in 1010  out 1010
    clk 1  addr 1  rw 0  in 1010  out 1010
    clk 0  addr 0  rw 0  in 1010  out 0000
    clk 1  addr 0  rw 0  in 1010  out 0000
    clk 0  addr 0  rw 0  in 1010  out 0000
    clk 1  addr 0  rw 0  in 1010  out 0000
    clk 0  addr 1  rw 0  in 1010  out 1010

*/