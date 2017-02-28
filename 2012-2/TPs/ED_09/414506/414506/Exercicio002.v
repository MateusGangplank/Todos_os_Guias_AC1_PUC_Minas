// -------------------------
// Exercicio0002
// Nome: Fernando dos Santos Silva
// Matricula: 414506
// --------------------------- 


//-----------------------------------
//--- Contador assíncrono crescente
//-----------------------------------

	module jkff ( output q, output qnot, 
	input j, input k, input clr, input clk ); 
		
		reg q, qnot; 
			always @( posedge clk or posedge clr ) 
			
			begin 
			if (clr)
			begin
		 	 q = 0;
			 qnot = 1;
			end 
			
			if ( j & ~k ) 
			begin 
			q <= 1; qnot <= 0; 
			end 
			else 
			
			if ( ~j & k ) 
			begin 
			q <= 0; qnot <= 1; 
			end 
			
			else 
			if ( j & k ) 
				begin 
				 q <= ~q; qnot <= ~qnot; 
			end 
		end 
		endmodule // jkff 

	module Exercicio002();
	reg clk;
	reg clear;
	reg const;	
	reg [3:0] d;
	
	wire [4:0] snot;
	wire [4:0] s;
		
	
	jkff a1(s[4], snot[4], 1, 1, clear, clk);
	jkff a2(s[3], snot[3], 1, 1, clear, s[4]);
	jkff a3(s[2], snot[2], 1, 1, clear, s[3]);
	jkff a4(s[1], snot[1], 1, 1, clear, s[2]);
	jkff a5(s[0], snot[0], 1, 1, clear, s[1]);
	
	initial begin

// initial values 
	clk = 0; 
	clear = 0;
	
// input signal changing 
	#1 clear = 1;
	#1 clear = 0;
	
	#100 $finish; 
	
	end // initial 
	always 
		#5 clk = ~clk; 
	always @( posedge clk ) 

begin 
	
	$display ("Exercicio002 - Circuitos sequenciais - Flip-Flops");		
	$monitor ( "%4d %4b  %4b", $time, clk, snot); 

end 
endmodule	
	