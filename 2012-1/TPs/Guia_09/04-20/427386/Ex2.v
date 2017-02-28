// -------------------------
// Ex2 
// Nome: André Henriques Fernandes
// Matricula: 427386
// ------------------------- 

module jkff ( output q, output qnot, 
 input    j, input    k, input clk ); 
reg q, qnot; 
 
always @( posedge clk ) 
begin 
    if ( j & ~k ) 
     begin 
      q <= 1;   qnot <= 0; 
     end 
    else 
      if ( ~j & k ) 
       begin 
        q <= 0;   qnot <= 1; 
       end 
      else 
        if ( j & k ) 
         begin 
          q <= ~q;   qnot <= ~qnot; 
         end 
end 
 
endmodule // jkff

module clock ( clk ); 
 output clk; 
 reg      clk; 
 
 initial 
  begin 
   clk = 1'b0; 
  end 
 
 always 
  begin 
   #12 clk = ~clk; 
  end 
 
endmodule // clock ( )



module test_cont; 
// ------------------------- definir dados 
      reg data;
      wire clk,q0,qnot0,q1,qnot1,q2,qnot2,q3,qnot3,q4,qnot4;
		
		clock CLK1(clk);
		
		jkff JKFF1(q4,qnot4,data,data,clk);
		jkff JKFF2(q3,qnot3,data,data,q4);
		jkff JKFF3(q2,qnot2,data,data,q3);
		jkff JKFF4(q1,qnot1,data,data,q2);
		jkff JKFF5(q0,qnot0,data,data,q1);
		
		
      
      

 
// ------------------------- parte principal 
 initial begin 
      $display("Ex1 - André Henriques Fernandes - 427386");
      $display("Test Cont");
		$display("qnot4 qnot3 qnot2 qnot1 qnot0");
 
      $monitor("%1b %1b %1b %1b %1b",qnot4,qnot3,qnot2,qnot1,qnot0);
      
      #12 data = 1'b1;
      
      #100 $finish;
 
 end 
 
endmodule // test_cont