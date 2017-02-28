module dff ( output q, output qnot,  
input   d, input clk, input preset ); 
reg q, qnot; 
always @( posedge clk ) 
begin
	 if(~preset)
	 	begin
	 	q <= d;  qnot <= ~q; 
		end 
	 else 
	 	begin
    	q = 1; qnot = ~q;
		end 
end 
 
endmodule // dff

module ParalelToSerial(output[4:0] y, input[4:0] x,input clk,input load);
wire a0;
wire a1;
wire a2;
wire a3;
wire a4;
wire l0;
wire l1;
wire l2;
wire l3;
wire l4;
and and1(a0,x[4],load);
and and1(a1,x[3],load);
and and1(a2,x[2],load);
and and1(a3,x[1],load);
and and1(a4,x[0],load);
dff d4(y[4],,0,clk,a0);
dff d3(y[3],,y[4],clk,a1);
dff d2(y[2],,y[3],clk,a2);
dff d1(y[1],,y[2],clk,a3);
dff d0(y[0],,y[1],clk,a4);



endmodule

module Exemplo0059; 
reg[4:0] inp;
wire[4:0] outp; 
reg clk;
reg load;
ParalelToSerial p1(outp,inp,clk,load);
initial 
  begin 
// initial values 
       clk    = 1;        
       load       = 0;
		 inp			= 5'b10110;
 
// input signal changing 	
	
	#50
	load = 1;
	#10 $display ( "%b", outp );
	load = 0;
	#10 $display ( "%b", outp );	
	#10 $display ( "%b", outp );	
	#10 $display ( "%b", outp );	
	#10 $display ( "%b", outp );			
	#200 $finish; 
	
   end // initial 
 
 always 
  #5 clk = ~clk; 
 

   
 
endmodule // Exemplo0051