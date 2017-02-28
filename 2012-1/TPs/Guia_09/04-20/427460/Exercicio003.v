// -------------------------
// Exercicio0003 - 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// --------------------------- 


//-----------------------------------
//--- Contador decádico decrescente
//-----------------------------------

	module jkff ( output q, output qnot, 
	input j, input k, input pre, input clk ); 
		
		reg q, qnot; 
			always @( posedge clk  or  pre ) 
			
			begin 
			if(pre)
			begin
			 q = 1;
			 qnot = 0;
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

	module Exercicio003();
	reg clk;
	reg clear;
	reg const;	
	reg [3:0] d;
	
	wire [4:0] snot;
	wire [4:0] s;
	wire s1;
	wire s2;
	
	and and1(s1, ~snot[0], snot[1], ~snot[2], snot[3], snot[4]);
	or or1 (s2, clear, 0, s1);		
	
	
	jkff a1(s[0], snot[0], 1, 1, s2, clk);
	jkff a2(s[1], snot[1], 1, 1, s2, s[0]);
	jkff a3(s[2], snot[2], 1, 1, s2, s[1]);
	jkff a4(s[3], snot[3], 1, 1, s2, s[2]);
	jkff a5(s[4], snot[4], 1, 1, s2, s[3]);
	
		
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
	
		
	$monitor ( "%4d %4b  %4b", $time, clk, s); 
	
 	
end 
endmodule	
	