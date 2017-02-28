// ---------------------
// MULTIPLIER
// Nome: Daniel Sathler Silva
// Matricula: 405795
// ---------------------

// ---------------------
// -- halfadder
// ---------------------

module halfadder (s, s0, a, b);
 output s, s0;
 input  a, b;

 wire s, s0, s1, s2;
 reg p,q;
 
 or OR1(s1, a, b);
 and AND1(s0, a, b);
 not NOT1(s2, s0);
 and AND2(s, s1, s2); 

endmodule // halfadder


// ---------------------
// -- multiplier
// ---------------------


module multiplier(s0, s1, s2, s3, a, b, a1, b1);
 output s0, s1, s2, s3;
 input  a, b, a1, b1;

 and AND1(s0 ,a, a1);
 and AND2(s12 ,a, b1);
 and AND3(s13 ,a1, b);
 and AND4(s14, b, b1);
 halfadder HALFADDER1(s1, s4, s12, s13);
 halfadder HALFADDER2(s2, s3, s14, s4);
 
 
endmodule // multiplier

// ---------------------
// -- test multiplier
// ---------------------

module testmultiplier;
 reg   Cin, a, b, a1, b1;             
 wire  s0, s1, s2, s3;
          
			 // instancia
	multiplier MULTIPLIER1 (s0, s1, s2, s3, a, b, a1, b1);
	
		 // parte principal
 initial begin
 
      $display("MULTIPLIER - Daniel Sathler Silva - 405795");
      $display("Test MULTIPLIER");
      $display("\n a   *   b  = s \n");
      $monitor(" %b %b * %b %b = %b %b %b %b", a, b, a1, b1, s0, s1, s2, s3);
  #1  a=0; b=0; a1=0; b1=0;
  #1  a=0; b=0; a1=0; b1=1;
  #1  a=0; b=0; a1=1; b1=0;
  #1  a=0; b=0; a1=1; b1=1;
  #1  a=0; b=1; a1=0; b1=0;
  #1  a=0; b=1; a1=0; b1=1;
  #1  a=0; b=1; a1=1; b1=0;
  #1  a=0; b=1; a1=1; b1=1;
  #1  a=1; b=0; a1=0; b1=0;
  #1  a=1; b=0; a1=0; b1=1;
  #1  a=1; b=0; a1=1; b1=0;
  #1  a=1; b=0; a1=1; b1=1;
  #1  a=1; b=1; a1=0; b1=0;
  #1  a=1; b=1; a1=0; b1=1;
  #1  a=1; b=1; a1=1; b1=0;
  #1  a=1; b=1; a1=1; b1=1;
 
  
 
 end

endmodule // testmultiplier