// -------------------------
// Exercicio4
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------
  module jkff ( output q, output qnot,
 input    j, input    k, input clk, input clr ); 
reg q, qnot; 

initial
	begin
		if(clr)
			begin
				q <= 0; qnot <= 1;
			end
	end

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
      reg data,clr1;
      wire clk,q0,qnot0,q1,qnot1,q2,qnot2,q3,qnot3,q4,qnot4,clr,w0,datanot;
		
		clock CLK1(clk);
		
		nand NAND1(w0,qnot4,q3,qnot2,q1,qnot0);
		nand NAND2(clr,w0,clr1);
		jkff JKFF1(q4,qnot4,data,data,clk,clr);
		jkff JKFF2(q3,qnot3,data,data,qnot4,clr);
		jkff JKFF3(q2,qnot2,data,data,qnot3,clr);
		jkff JKFF4(q1,qnot1,data,data,qnot2,clr);
		jkff JKFF5(q0,qnot0,data,data,qnot1,clr);
		
// ------------------------- parte principal
 initial begin 
      $display("Exercicio4 - Gustavo Barbosa - 427410");
      $display("Test Shift Register"); 
      $display("q0 q1 q2 q3 q4");
 
      $monitor("%1b %1b %1b %1b %1b",q0,q1,q2,q3,q4);
      
      #12 data = 1'b1; clr1 = 1'b1;
 
 end 
 
endmodule // test_cont






