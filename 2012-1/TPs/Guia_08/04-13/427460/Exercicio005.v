// -------------------------
// Exercicio0005 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// --------------------------- 


//-----------------------
//--- Parallel_In/ Serial_Out
//-----------------------

	module dff ( output q, output qnot, 
		input d, input pre, input clr, input clk ); 
		reg q, qnot; 
	
	always @( posedge clk or posedge clr or  pre ) 
	
		begin 
		if (clr)
			begin
		 	q = 0;
			qnot = 1;
			end 
		else if(pre)
			begin
			q = 1;
			qnot = 0;
			end
		else 		
			begin
			q <= d;
	  	 	qnot = ~q; 
			end
	end 
endmodule // dff 


	module Exercicio005();
	reg clk;
	reg ld;
	reg preset; 
	reg clear;	
	reg [3:0] d;
	
	wire [3:0] snot;
	wire [3:0] s;
		
	wire [3:0]q;
	
	and and1(q[0], ld, d[0]);	
	and and2(q[1], ld, d[1]);
	and and3(q[2], ld, d[2]);
	and and4(q[3], ld, d[3]);
		
	
	dff a1(s[0], snot[0], 0, q[0], clear, clk);
	dff a2(s[1], snot[1], s[0], q[1], clear, clk);
	dff a3(s[2], snot[2], s[1], q[2], clear,clk);
	dff a4(s[3], snot[3], s[2], q[3], clear, clk);
	
	
	initial begin

// initial values 
	clk = 0; 
	ld = 0; 
	clear = 0;
	d = 0000;

// input signal changing 
	#1 clear = 1;
	#1 clear = 0;
	#1 d = 1010;
	#1 ld = 1;
	#1 ld = 0;
	#30 $finish; 
	
	end // initial 
	always 
		#5 clk = ~clk; 
	always @( posedge clk ) 

begin 
	
		
	$monitor ( "%4d %4b  %4b  %4b", $time, ld, d, s ); 
	
 	
end 
endmodule	
	