// -------------------------
// Exercicio3
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------
module dff ( output q, output qnot,input   d, input clk );
	reg q, qnot;
 
	always @( posedge clk ) 
	begin 
	   q <= d;  qnot <= ~q; 
	end 
 
endmodule // dff

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



module test_regDesl; 
// ------------------------- definir dados 
      reg data,clr;
      wire clk,q0,qnot0,q1,qnot1,q2,qnot2,q3,qnot3,w0;
		
		clock CLK1(clk);
		
		or OR1(w0,data,q3);
		dff DFF1(q0,qnot0,w0,clk);
		dff DFF2(q1,qnot1,q0,clk);
		dff DFF3(q2,qnot2,q1,clk);
		dff DFF4(q3,qnot3,q2,clk);
		
		
// ------------------------- parte principal
 initial begin
      $display("Exercicio2 - Gustavo Barbosa - 427410");
      $display("Test Shift Register"); 
		$display("data q0 q1 q2 q3");
 
      $monitor("%1b %1b %1b %1b %1b",data,q0,q1,q2,q3);
      
      #12 data = 1'b1;
	#12 data = 1'b0;
 
 end 
 
endmodule // test_regDesl