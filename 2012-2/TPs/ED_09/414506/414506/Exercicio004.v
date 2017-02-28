// -------------------------
// Exercicio004
// Nome: Fernando dos Santos Silva
// Matricula: 414506
// --------------------------- 


//-----------------------------------
//--- Contador decádico crescente
//-----------------------------------

	module jkff ( output q, output qnot, 
	input j, input k, input clr, input clk ); 
		
		reg q, qnot; 
			always @( posedge clk  or  posedge clr ) 
			
			begin 
			if(clr)
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

	module Exercicio004();
	reg clk;
	reg clear;
	reg const;	
	reg [3:0] d;
	
	wire [4:0] snot;
	wire [4:0] s;
	wire s1;
	wire s2;
	
	nor nor1(s1, ~s[0], s[1], ~s[2], s[3], s[4]);
	nor nor2(s2, clear, s2);		
	
	
	jkff a1(s[0], snot[0], 1, 1, s2, clk);
	jkff a2(s[1], snot[1], 1, 1, s2, snot[0]);
	jkff a3(s[2], snot[2], 1, 1, s2, snot[1]);
	jkff a4(s[3], snot[3], 1, 1, s2, snot[2]);
	jkff a5(s[4], snot[4], 1, 1, s2, snot[3]);
	
		
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
	
	$display ("Exercicio004 - Circuitos sequenciais - Flip-Flops");
	$monitor ( "%4d %4b  %4b", $time, clk, s); 
	
end 
endmodule	