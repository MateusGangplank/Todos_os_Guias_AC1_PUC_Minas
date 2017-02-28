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
  

   module mux2x4(output[3:0]s,input[3:0]a0,input[3:0]a1,input c);
	   reg[3:0]s = 4'b0000;
	   always #1 begin
         if (c) begin
	         s <= a0;
	      end
	  
 	      else if(~c) begin
	         s <= a1;
	      end
	   end
   endmodule // mux2x4
  
  
  module questao2( output[3:0]s, input addr, input rw, input clk, input[3:0]i );
     wire[3:0]a0;
     wire[3:0]a1;
     questao1 q11(a0,addr,rw,clk,i);
	  questao1 q12(a1,~addr,rw,clk,i);
	  mux2x4 m(s,a0,a1,addr);
  endmodule // questao2
  
  
  module buffer(output s,input a);
     assign s = a;
  endmodule // buffer
  
  
  module questao3( output[7:0]s, input addr, input rw, input clk, input[7:0]i );
     wire[3:0]a0;
     wire[3:0]a1;
	  wire[3:0]s0;
	  wire[3:0]s1;
	  buffer b0(a0[0],i[0]);
	  buffer b1(a0[1],i[1]);
	  buffer b2(a0[2],i[2]);
	  buffer b3(a0[3],i[3]);
	  buffer b4(a1[0],i[4]);
	  buffer b5(a1[1],i[5]);
	  buffer b6(a1[2],i[6]);
	  buffer b7(a1[3],i[7]);
	  
	  questao1 q11(s0,addr,rw,clk,a0);
	  questao1 q12(s1,addr,rw,clk,a1);
	  
	  buffer b8(s[0],s0[0]);
	  buffer b9(s[1],s0[1]);
	  buffer b10(s[2],s0[2]);
	  buffer b11(s[3],s0[3]);
	  buffer b12(s[4],s1[0]);
	  buffer b13(s[5],s1[1]);
	  buffer b14(s[6],s1[2]);
	  buffer b15(s[7],s1[3]);
  endmodule // questao3
  
  
  module mux2x8(output[7:0]s,input[7:0]a0,input[7:0]a1,input c);
	   reg[7:0]s = 8'b00000000;
	   always #1 begin
         if (c) begin
	         s <= a0;
	      end
	  
 	      else if(~c) begin
	         s <= a1;
	      end
	   end
   endmodule // mux2x8
  
  
  module questao4(output[7:0]s, input addr, input rw, input clk, input[7:0]i);
     wire[3:0]a0;
     wire[3:0]a1;
	  wire[3:0]s00;
	  wire[3:0]s01;
	  wire[3:0]s10;
	  wire[3:0]s11;
	  wire[7:0]s0;
	  wire[7:0]s1;
	  buffer b0(a0[0],i[0]);
	  buffer b1(a0[1],i[1]);
	  buffer b2(a0[2],i[2]);
	  buffer b3(a0[3],i[3]);
	  buffer b4(a1[0],i[4]);
	  buffer b5(a1[1],i[5]);
	  buffer b6(a1[2],i[6]);
	  buffer b7(a1[3],i[7]);
	  
	  questao2 q21(s00,~addr,rw,clk,a0);
	  questao2 q22(s01,~addr,rw,clk,a1);
	  questao2 q23(s10,addr,rw,clk,a0);
	  questao2 q24(s11,addr,rw,clk,a1);
	  
	  buffer b8(s0[0],s00[0]);
	  buffer b9(s0[1],s00[1]);
	  buffer b10(s0[2],s00[2]);
	  buffer b11(s0[3],s00[3]);
	  buffer b12(s0[4],s01[0]);
	  buffer b13(s0[5],s01[1]);
	  buffer b14(s0[6],s01[2]);
	  buffer b15(s0[7],s01[3]);
	  
	  buffer b16(s1[0],s10[0]);
	  buffer b17(s1[1],s10[1]);
	  buffer b18(s1[2],s10[2]);
	  buffer b19(s1[3],s10[3]);
	  buffer b20(s1[4],s11[0]);
	  buffer b21(s1[5],s11[1]);
	  buffer b22(s1[6],s11[2]);
	  buffer b23(s1[7],s11[3]);
	  
	  mux2x8 m(s,s0,s1,addr);
  endmodule // questao4
  
  
  module teste;
  
  reg addr,rw,clk;
  reg[7:0]i;
  wire[7:0]s;
  
  
  questao4 q4(s,addr,rw,clk,i);
	  
	  initial begin
        clk = 0; i = 8'b11001010; addr = 0; rw = 1;
		  #10 i = 8'b01101001;
		  #10 i = 8'b00000000; rw = 0;
		  #100 $finish;
     end
	  
	  always begin
		  #10 addr = addr +1;
	  end
		  
	  always begin
	     #5 clk = ~clk;
	  end
	  
	  always @(clk)begin
	     $display("clk %b  addr %b  rw %b  in %8b  out %8b",clk,addr,rw,i,s);
	  end
  endmodule

/*

    clk 0  addr 0  rw 1  in 11001010  out 00000000
    clk 1  addr 0  rw 1  in 11001010  out 00000000
    clk 0  addr 1  rw 1  in 01101001  out 11001010
    clk 1  addr 1  rw 1  in 01101001  out 00000000
    clk 0  addr 0  rw 0  in 00000000  out 01101001
    clk 1  addr 0  rw 0  in 00000000  out 11001010
    clk 0  addr 1  rw 0  in 00000000  out 11001010
    clk 1  addr 1  rw 0  in 00000000  out 01101001
    clk 0  addr 0  rw 0  in 00000000  out 01101001
    clk 1  addr 0  rw 0  in 00000000  out 11001010
    clk 0  addr 1  rw 0  in 00000000  out 11001010
    clk 1  addr 1  rw 0  in 00000000  out 01101001
    clk 0  addr 0  rw 0  in 00000000  out 01101001
    clk 1  addr 0  rw 0  in 00000000  out 11001010
    clk 0  addr 1  rw 0  in 00000000  out 11001010
    clk 1  addr 1  rw 0  in 00000000  out 01101001
    clk 0  addr 0  rw 0  in 00000000  out 01101001
    clk 1  addr 0  rw 0  in 00000000  out 11001010
    clk 0  addr 1  rw 0  in 00000000  out 11001010
    clk 1  addr 1  rw 0  in 00000000  out 01101001
    clk 0  addr 0  rw 0  in 00000000  out 01101001
    clk 1  addr 0  rw 0  in 00000000  out 11001010
    clk 0  addr 1  rw 0  in 00000000  out 11001010
    clk 1  addr 1  rw 0  in 00000000  out 01101001
    clk 0  addr 0  rw 0  in 00000000  out 01101001

*/