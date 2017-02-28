// -------------------------
// Exercicio5
// Nome: Gustavo Barbosa
// Matricula: 427410
// -------------------------

module dff ( output q, output qnot,
	input   d, input clk ,input preset,input clr); 
	reg q, qnot; 
 	
	initial
	begin
		if(clr)
		begin
			q = 0;
			qnot = 1;
		end
		else
		begin
			q <= preset; 
			qnot <= ~preset;
		end
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
      reg clr,load,d0,d1,d2,d3;
      wire clk,q0,qnot0,q1,qnot1,q2,qnot2,q3,qnot3,preset1,preset2,preset3,preset4;
		
		clock CLK1(clk);
		
		and AND1(preset4,load,d3);
		and AND2(preset3,load,d2);
		and AND3(preset2,load,d1);
		and AND4(preset1,load,d0);
		
		dff DFF1(q0,qnot0,0,clk,preset1,clr);
		dff DFF2(q1,qnot1,q0,clk,preset2,clr);
		dff DFF3(q2,qnot2,q1,clk,preset3,clr);
		dff DFF4(q3,qnot3,q2,clk,preset4,clr);
		
// ------------------------- parte principal
 initial begin
      $display("Exercicio5 - Gustavo Barbosa - 427410");
      $display("Test Shift Register"); 
		$display("d0 d1 d2 d3 q0 q1 q2 q3");
 
      $monitor("%1b %1b %1b %1b %1b %1b %1b %1b",d0,d1,d2,d3,q0,q1,q2,q3);
      
      #1 d2 = 1'b1; d3 = 1'b1;
		#1 load = 1'b1;
 
 end 
 
endmodule // test_regDesl