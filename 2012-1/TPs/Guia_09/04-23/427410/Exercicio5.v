// -------------------------
// Exercicio5
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------
 module tff ( output q, output qnot,
  input    t, input    clk, input clear ); 
 
reg q, qnot; 

initial
begin
if ( clear )
  begin 
   q = 0;   qnot = 1; 
  end
end 
 
always @( posedge clk ) 
begin 
 if ( t ) 
   begin 
    q <= ~q;  qnot <= ~qnot; 
   end 
end 
 
endmodule // tff


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
      reg clr1;
      wire clk,q0,qnot0,q1,qnot1,q2,qnot2,q3,qnot3,clr,w0,datanot;
		
		clock CLK1(clk);
		
		and AND1(w0,q3,qnot2,qnot1,qnot0);
		or OR1(clr,w0,clr1);
		tff TFF1(q3,qnot3,clk,clk,clr);
		tff TFF2(q2,qnot2,qnot2,qnot2,clr);
		tff TFF3(q1,qnot1,qnot1,qnot1,clr);
		tff TFF4(q0,qnot0,qnot0,qnot0,clr);

// ------------------------- parte principal 
 initial begin 
      $display("Exercicio5 - Gustavo Barbosa - 427410");
      $display("Test Shift Register"); 
      $display("q3 q2 q1 q0");
 
      $monitor("%1b %1b %1b %1b",q3,q2,q1,q0);
      
      
		
 
 end
 
endmodule // test_cont