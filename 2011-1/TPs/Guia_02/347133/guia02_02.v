// Guia 02_02 - AND
// Nome: Henrique Carvalho Parreira
// Matricula: 347133


// ---------------------
// -- nor gate
// ---------------------

module norgate (s, p, q);
 output s;
 input  p, q;
 
 assign s = ~( p | q);

endmodule // norgate

// ---------------------
// -- and gate with nor
// ---------------------

module andgate (s0, p, q);
 output s0;
 wire s1,  s2;
 input  p, q;
 
 norgate NOR1 (s1,p,p);
 norgate NOR2 (s2,q,q);
 norgate NOR3 (s0,s1,s2);

endmodule // andgate 


// ---------------------
// -- test and gate with nor
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
      $display("Guia 02_02 - Henrique Carvalho Parreira - 347133");
      $display("Test AND gate");
      $display("\na & b = s\n");
      $monitor("%b & %b = %b", a, b, s);
  #1  a=0; b=1;
  
  #1  a=1; b=0;
  
  #1  a=1; b=1;
  
 end

endmodule // testandgate