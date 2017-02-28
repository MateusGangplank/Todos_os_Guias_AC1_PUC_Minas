// -------------------------
// Exercicio 1
// Nome: Marlon Henrique de Azeredo Formiga
// Matricula: 397248
// ------------------------- 

module jkff (output q, output qnot, input x, input y, input clk); 
reg q, qnot; 
 
always @( posedge clk ) 
begin 
    if (x & ~y) 
     begin 
      q <= 1;   qnot <= 0; 
     end 
    else 
      if (~x & y) 
       begin
        q <= 0;   qnot <= 1; 
       end 
      else 
        if (x & y) 
         begin 
          q <= ~q;   qnot <= ~qnot; 
         end 
end 

endmodule //jkff

module clock ( clk );
 output clk;
 reg clk;

 initial 
  begin 
   clk = 1'b0;
  end

 always
  begin 
   #12 clk = ~clk; 
  end 
endmodule //clock ( )



module test_cont; 
// ------------------------- definir dados 
      reg data=0;
      wire clk,q0,qnot0,q1,qnot1,q2,qnot2,q3,qnot3,q4,qnot4;
		
		clock CLK1(clk);
		
		jkff JKFF1(q4,qnot4,data,data,clk);
		jkff JKFF2(q3,qnot3,data,data,qnot4);
		jkff JKFF3(q2,qnot2,data,data,qnot3);
		jkff JKFF4(q1,qnot1,data,data,qnot2);
		jkff JKFF5(q0,qnot0,data,data,qnot1);
		
		
      
      

 
// ------------------------- parte principal 
 initial begin 
      	$display("qnot4 qnot3 qnot2 qnot1 qnot0");
 
      $monitor("%1b %1b %1b %1b %1b",qnot4,qnot3,qnot2,qnot1,qnot0);
      
      #12 data = 1'b1;
      
      #100 $finish;
 
 end 
 
endmodule // test_cont