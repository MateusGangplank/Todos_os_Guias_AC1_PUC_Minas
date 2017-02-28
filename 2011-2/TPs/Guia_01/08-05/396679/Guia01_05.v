// ---------------------
// Guia01_05 - OR usando De Morgan
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- OR gate
// ---------------------

module orgate (s, p, q, r);
 output s;
 input  p, q, r;

 assign s = ~(~p & ~q & ~r);

endmodule // orgate

// ---------------------
// -- test OR gate
// ---------------------

module testorgate;
 reg   a, b, c;
 wire  s;
          // instancia
 orgate OR1 (s, a, b, c);
          // parte principal
 initial begin:start
      a=0; b=0;c=0; 
      $display("Guia01_05 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test OR gate usando De Morgan");
		$display("~(~a|~b|~c)= S");
		$monitor("   %b  %b  %b = %b", a, b, c, s);
  	#1  a=0; b=0;c=1;
	#1  a=0; b=1;c=0;
	#1  a=0; b=1;c=1;
	#1  a=1; b=0;c=0;
	#1  a=1; b=0;c=1;
	#1  a=1; b=1;c=0;
	#1  a=1; b=1;c=1;	
 end

endmodule // testorgate