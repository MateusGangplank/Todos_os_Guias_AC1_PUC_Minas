// -------------------------
// Extra01
// Nome: Flávio Andrade Amaral Motta 
// Matricula: 392001 
// --------------------------- 


//-----------------------------------
//--- Contador em anel 
//-----------------------------------

	module jkff ( output q, output qnot, 
 	input j, input k, input clock, input clear ); 
	reg q, qnot; 
 
	always @( posedge clock or posedge clear ) 
	begin 
	if (clear)
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
	reg clock;
	reg clear;
	reg inp;
	reg pre;
	

	wire [4:0] snot;
	wire [4:0] s;
	wire s2;
		
	or or1(s2, inp, s[4]);
	
	jkff a1(s[0], snot[0], s2, ~s2, clock, clear);
	jkff a2(s[1], snot[1], s2, ~s[0], clock, clear);
	jkff a3(s[2], snot[2], s2, ~s[1], clock, clear);
	jkff a4(s[3], snot[3], s2, ~s[2], clock, clear);
	jkff a5(s[4], snot[4], s2, ~s[3], clock, clear);
	
		
	initial begin

// initial values 
	clock = 0; 
	clear = 0;
	
	
// input signal changing 
	#1 clear = 1;
	#1 clear = 0;
	#1 inp = 1;
	#1 inp = 1;
	
	#100 $finish; 
	
	end // initial 
	always 
		#5 clock = ~clock; 
	always @( posedge clock ) 

begin 
	
		
	$monitor ( "%4d %4b  %4b", $time, clock, s); 
	
 	
end 
endmodule	
	