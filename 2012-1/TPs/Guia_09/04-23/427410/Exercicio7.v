// -------------------------
// Exercicio7
// Nome: Gustavo Barbosa
// Matricula: 427410
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
      wire clk,q0,qnot0,q1,qnot1,q2,qnot2,q3,qnot3,q4,qnot4,w,wnot;
		
		clock CLK1(clk);
		
		
		jkff JKFF1(q4,qnot4,qnot0,q0,clk);
		jkff JKFF2(q3,qnot3,q4,qnot4,clk);
		jkff JKFF3(q2,qnot2,q3,qnot3,clk);
		jkff JKFF4(q1,qnot1,q2,qnot2,clk);
		jkff JKFF5(q0,qnot0,q1,qnot1,clk);


// ------------------------- parte principal 
 initial begin 
      $display("Exercicio7 - Gustavo Barbosa - 427410");
      $display("Test Shift Register"); 
		$display("qnot0 qnot1 qnot2 qnot3 qnot4");
 
      $monitor("%1b %1b %1b %1b %1b",qnot0,qnot1,qnot2,qnot3,qnot4);
      
      #12 data = 1'b1;
 
 end 
 
endmodule // test_cont
