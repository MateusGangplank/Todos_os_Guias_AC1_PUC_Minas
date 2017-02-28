// ---------------------
// Guia 02_02 - AND
// Nome: Thaise Souto Martins
// Matricula: 395504
// ---------------------


// ---------------------
// -- nor gate
// ---------------------

module norgate (s0, p, q);
 output s0;
 input  p, q;

 assign s0 = ~(p | q);

endmodule // norgate



// ---------------------
// -- and gate
// ---------------------

module andgate (s0, p, q);
 output s0;
 wire s1,  s2;
 input  p, q;

 norgate NORGATE1 (s1,p,p);
 norgate NORGATE2 (s2,q,q);
 norgate NORGATE3 (s0,s1,s2);
 
endmodule // andgate


// ---------------------
// -- test and gate
// ---------------------

module testandgate;
 reg   a, b;
 wire  s;
          // instancia
 andgate AND1 (s, a, b);
 
  initial begin:start
  	  a=0; b=0;
	  
 end
 
          // parte principal
 initial begin
      $display("Guia 02_02 - Thaise Souto Martins - 395504");
      $display("Test AND gate");
      $display("\na & b = s\n");
      $monitor("%b & %b = %b", a, b, s);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testandgate
