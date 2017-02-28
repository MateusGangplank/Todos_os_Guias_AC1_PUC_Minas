// -------------------------
// Exercicio3
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------
 module jkff ( output q, output qnot,
 input    j, input    k, input clk, input preset ); 
reg q, qnot; 

initial
	begin
		if(preset)
			begin
				q <= 1; qnot <= 0;
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
      reg data;
      wire clk,q0,qnot0,q1,qnot1,q2,qnot2,q3,qnot3,q4,qnot4,preset,w0,datanot;
		
		clock CLK1(clk);
		
		and AND1(w0,q4,qnot3,q2,qnot1,q0);
		or OR1(preset,w0,datanot);
		not NOT1(datanot,data);
		jkff JKFF1(q4,qnot4,data,data,clk,preset);
		jkff JKFF2(q3,qnot3,data,data,q4,preset);
		jkff JKFF3(q2,qnot2,data,data,q3,preset);
		jkff JKFF4(q1,qnot1,data,data,q2,preset);
		jkff JKFF5(q0,qnot0,data,data,q1,preset);

// ------------------------- parte principal
 initial begin 
      $display("Exercicio3 - Gustavo Barbosa - 427410");
      $display("Test Shift Register"); 
		$display("q0 q1 q2 q3 q4");
 
      $monitor("%1b %1b %1b %1b %1b",q0,q1,q2,q3,q4);
      
      #12 data = 1'b1;
 
 end 
 
endmodule // test_cont