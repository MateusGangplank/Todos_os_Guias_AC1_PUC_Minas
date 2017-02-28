//-------------------------
//Yousef Otacilio
//441714
//Guia09 Exercicio 01
//------------------------
//


`include "clock.v"

//------------------------------------------------------
//------------------------------------------------------


 module jkff  ( output q, output qnot, input j, input k, input clock, input preset, input clear ); 

reg q, qnot;

always @(posedge clock or posedge clear)

	begin
	
		if(clear)
		begin
			q = 0;	qnot = 1;
		end
		
		else if(preset)
		begin
			q = 1;	qnot = 0;
		end

		else if ( j & ~k ) 
		begin 
			q <= 1;	qnot <= 0; 
		end
		 
		else if ( ~j & k ) 
		begin 
			q <= 0;	qnot <= 1; 
		end 

		else if ( j & k ) 
		begin 
			q <= ~q;	qnot <= ~qnot; 
		end
	
	end
		
     endmodule // jkff 	
//------------------------------------------------------
//------------------------------------------------------


module Ex01 (output [4:0]s, input clk, input um, input present, input clear);

   wire [4:0]q;
	wire [4:0]qnot;
				
  jkff JK1(q[4],qnot[4],um, um, clk, present, clear);
  jkff JK2(q[3],qnot[3],um, um, qnot[4], present, clear);
  jkff JK3(q[2],qnot[2],um, um, qnot[3], present, clear);
  jkff JK4(q[1],qnot[1],um, um, qnot[2], present, clear);
  jkff JK5(q[0],qnot[0],um, um, qnot[1], present, clear);
		 
		 
	assign s[0] = qnot[4];
	assign s[1] = qnot[3];
	assign s[2] = qnot[2];
	assign s[3] = qnot[1];
	assign s[4] = qnot[0];
	
endmodule//Ex01



module teste;

   wire [4:0]s;
	wire CLK;
	
	reg x;
	reg clr;
	reg pre;
	
	clock clk(CLK);
	
	Ex01 tetes(s,CLK, x, pre, clr);
	
	initial begin
	
		clr = 1;
		pre = 0;
		x = 0;
		
		
		$display(" Guia09 - Exercicio01");
		$display(" Yousef Otacilio");
		$display(" 441714 ");
	    
		$display("Saida   Clock ");
		$monitor("%5b    %1b  "  , s, CLK);
	
		
		#1 clr = 1;
		#2 clr = 0;
		#2 x = 1;
		
		#61 $finish;
	end
endmodule //