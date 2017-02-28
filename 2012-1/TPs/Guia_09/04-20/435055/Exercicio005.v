// -------------------------
// Exercicio005 - 
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// --------------------------- 


//-----------------------------------
//--- Contador modulo 8
//-----------------------------------

	module tff ( output q, output qnot, 
	input t, input clk, input preset, input clr ); 

		reg q, qnot; 
		
		always @( posedge clk or  posedge clr ) 
		
		begin 
		if ( clr ) 
		begin 
		 q = 0; qnot = 1; 
		end 
		
		else 
		if ( preset ) 
		begin 
		 q = 1; qnot = 0; 
		end 
		
		else 
		begin 
		if ( t ) 
		begin 
		 q <= ~q; 
		 qnot <= ~q; 
		end 
		
		end 
	end 
endmodule // tff 

	module Exercicio005();
	reg clk;
	reg clear;
	reg pre;
	

	wire [3:0] snot;
	wire [3:0] s;
	wire s1;
	wire s2;
			
	and and1(s1, s[0], ~s[1], ~s[2], s[3]);
	or or1(s2, clear, s1);
	
	tff a1(s[0], snot[0], clk, clk, pre, s2);
	tff a2(s[1], snot[1], snot[0], snot[0], pre, s2);
	tff a3(s[2], snot[2], snot[1], snot[1], pre, s2);
	tff a4(s[3], snot[3], snot[2], snot[2], pre, s2);

	
		
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
	
	$display ("Exercicio005 - Circuitos sequenciais - Flip-Flops");
	$monitor ( "%4d %4b  %4b", $time, clk, s); 	
 	
end 
endmodule