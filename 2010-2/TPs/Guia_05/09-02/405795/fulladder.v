// ---------------------
// FULL-ADDER-3B
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
// -- fulladder
// ---------------------

module fulladder (s, s0, Cin, a, b);
 output s, s0;
 input  Cin, a, b;

 wire s, s0, s1, s2, s3;
 reg p,q,r;
 
 halfadder HALFADDER1(s1, s2, a, b);
 halfadder HALFADDER2(s, s3, Cin, s1);
 or OR1(s0, s2, s3);
 

endmodule // fulladder

// ---------------------
// -- fulladder3b
// ---------------------


module fulladder3b (s0, s1, s2, s3, Cin, a, b, c, a1, b1, c1);
 output s0, s1, s2, s3;
 input  Cin, a, b, c, a1, b1, c1;

 fulladder FULLADDER1(s0, s4, Cin, a, a1);
 fulladder FULLADDER2(s1, s5, s4, b, b1);
 fulladder FULLADDER3(s2, s3, s5, c, c1);
 

endmodule // fulladder3b

// ---------------------
// -- test fulladder
// ---------------------

module testfulladder;
 reg   Cin, a, b, c, a1, b1, c1;             
 wire  s0, s1, s2, s3;
          
			 // instancia
	fulladder3b FULLADDER3B1 (s0, s1, s2, s3, Cin, a, b, c, a1, b1, c1);
	
		 // parte principal
 initial begin
 
      $display("FULLADDER3B - Daniel Sathler Silva - 405795");
      $display("Test FULLADDER3B");
      $display("\n(c)  a    +   b   = s\n");
      $monitor("(%b) %b %b %b + %b %b %b = %b %b %b %b", Cin, a, b, c, a1, b1, c1, s0, s1, s2, s3);
  #1  Cin=0; a=0; b=0; c=0; a1=0; b1=0; c1=0;
  #1  Cin=0; a=0; b=0; c=1; a1=0; b1=0; c1=1;
  #1  Cin=0; a=0; b=1; c=0; a1=0; b1=1; c1=0;
  #1  Cin=0; a=0; b=1; c=1; a1=0; b1=1; c1=1;
  #1  Cin=0; a=1; b=0; c=0; a1=1; b1=0; c1=0;
  #1  Cin=0; a=1; b=0; c=1; a1=1; b1=0; c1=1;
  #1  Cin=0; a=1; b=1; c=0; a1=1; b1=1; c1=0;
  #1  Cin=0; a=1; b=1; c=1; a1=1; b1=1; c1=1;
 
  
 
 end

endmodule // testfulladder3b