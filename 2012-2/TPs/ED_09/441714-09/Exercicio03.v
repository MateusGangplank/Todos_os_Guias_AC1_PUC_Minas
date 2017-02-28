//-------------------------
//Yousef Otacilio
//441714
//Guia09 Exercicio 03
//------------------------
//


`include "clock.v"
`include "JKFF.v"

//------------------------------------------------------
//------------------------------------------------------


 //------------------------------------------------------
//------------------------------------------------------


module Ex03 (output [5:0]s, input clk, input signal, input present, input clear);

   wire [5:0]q;
	assign q[0] = 0;
	assign q[1] = 0;
	assign q[2] = 0;
	assign q[3] = 0;
	assign q[4] = 0;
	assign q[5] = 0;	
	
	wire [5:0]qnot;
	
	wire AndZ;
	wire AndC;
	
	nand AZ (AndZ,~q[0],q[1],~q[2],q[3],~q[4],q[5]);
	nand AC (AndC, AZ, clear);
					
					
  ffJK JK1(q[0],qnot[0],signal, signal, clk, present, clear);
  ffJK JK2(q[1],qnot[2],signal, signal, qnot[0], present, AC);
  ffJK JK3(q[2],qnot[2],signal, signal, qnot[1], present, AC);
  ffJK JK4(q[3],qnot[3],signal, signal, qnot[2], present, AC);
  ffJK JK5(q[4],qnot[4],signal, signal, qnot[3], present, AC);
  ffJK JK6(q[5],qnot[5],signal, signal, qnot[4], present, AC);	
  
  
   assign s[0] = q[5];
	assign s[1] = q[4];
	assign s[2] = q[3];
	assign s[3] = q[2];
	assign s[4] = q[1];
	assign s[5] = q[0];	 
	 	 
	 
endmodule//Ex03



module teste;

   wire [5:0]s;
	wire CLK;
	
	reg x;
	reg clr;
	reg pre;
	
	clock clk(CLK);
	
	Ex03 tetes(s,CLK, x, pre, clr);
	
	initial begin
	
		clr = 1;
		pre = 0;
		x = 1;
		
		
		$display(" Guia09 - Exercicio03");
		$display(" Yousef Otacilio");
		$display(" 441714 ");
	    
		$display("Saida   Clock ");
		$monitor("%6b    %1b  "  , s, CLK);
	
		
		#1 clr = 1;
		#2 clr = 1;
		#2 x = 1;
		
		#64 $finish;
	end
endmodule //