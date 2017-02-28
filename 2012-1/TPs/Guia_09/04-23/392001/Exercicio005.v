// -------------------------
// Exercicio005
// Nome: Flávio Andrade Amaral Motta 
// Matricula: 392001 
// --------------------------- 


//-----------------------------------
//--- Contador modulo 8
//-----------------------------------

	module tff ( output q, output qnot, 
	input t, input clock, input preset, input clear ); 

		reg q, qnot; 
		
		always @( posedge clock or  posedge clear ) 
		
		begin 
		if ( clear ) 
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
	reg clock;
	reg clear;
	reg pre;
	

	wire [3:0] snot;
	wire [3:0] s;
	wire s1;
	wire s2;
			
	and and1(s1, s[0], ~s[1], ~s[2], s[3]);
	or or1(s2, clear, s1);
	
	tff a1(s[0], snot[0], clock, clock, pre, s2);
	tff a2(s[1], snot[1], snot[0], snot[0], pre, s2);
	tff a3(s[2], snot[2], snot[1], snot[1], pre, s2);
	tff a4(s[3], snot[3], snot[2], snot[2], pre, s2);

	
		
	initial begin

// initial values 
	clock = 0; 
	clear = 0;
	
// input signal changing 
	#1 clear = 1;
	#1 clear = 0;
	
	#100 $finish; 
	
	end // initial 
	always 
		#5 clock = ~clock; 
	always @( posedge clock ) 

begin 
	
		
	$monitor ( "%4d %4b  %4b", $time, clock, s); 
	
 	
end 
endmodule	
	