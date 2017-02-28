// -------------------------
// Extra01- 
// Nome: Rodrigo Arruda de Assis 
// Matricula: 427460 
// --------------------------- 


//-----------------------------------
//--- Contador em anel 
//-----------------------------------

	module jkff ( output q, output qnot, 
 	input j, input k, input clk, input clr ); 
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
      q <= 1;   qnot <= 0; 
     end 
    else 
      if ( ~j & k ) 
       begin 
        q <= 0;   qnot <= 1; 
       end 
      else 
        if ( j & k ) 
         begin 
          q <= ~q;   qnot <= ~qnot; 
         end 
	end 
 
endmodule // jkff 	

	module Extra01();
	reg clk;
	reg clear;
	reg inp;
	reg pre;
	

	wire [4:0] snot;
	wire [4:0] s;
	wire s2;
		
	or or1(s2, inp, s[4]);
	
	jkff a1(s[0], snot[0], s2, ~s2, clk, clear);
	jkff a2(s[1], snot[1], s2, ~s[0], clk, clear);
	jkff a3(s[2], snot[2], s2, ~s[1], clk, clear);
	jkff a4(s[3], snot[3], s2, ~s[2], clk, clear);
	jkff a5(s[4], snot[4], s2, ~s[3], clk, clear);
	
		
	initial begin

// initial values 
	clk = 0; 
	clear = 0;
	
	
// input signal changing 
	#1 clear = 1;
	#1 clear = 0;
	#1 inp = 1;
	#1 inp = 1;
	
	#100 $finish; 
	
	end // initial 
	always 
		#5 clk = ~clk; 
	always @( posedge clk ) 

begin 
	
		
	$monitor ( "%4d %4b  %4b", $time, clk, s); 
	
 	
end 
endmodule	
	