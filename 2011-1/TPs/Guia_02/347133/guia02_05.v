// Guia 02_05 - NAND
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
// -- nand gate with nor
// ---------------------

module nandgate (s0, p, q);
 output s0;
 wire s1, s2 ,s3;
 input  p, q;
 
 norgate NOR1 (s1,p,p);
 norgate NOR2 (s2,q,q);
 norgate NOR3 (s3,s1,s2);
 norgate NOR4 (s0,s3,s3);
 
endmodule // nandgate

// ---------------------
// -- test nand gate with nor
// ---------------------

module testnandgate;
 reg   a, b;
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b);
 
  initial begin:start
      a=0; b=0;
 end
 
          // parte principal
 initial begin
      $display("Guia 02_05 - Henrique Carvalho Parreira - 347133");
      $display("Test NAND gate");
      $display("\n~(a & b) = s\n");
      $monitor("~(%b & %b) = %b", a, b, s);
		
  #1  a=0; b=1;
  
  #1  a=1; b=0;
  
  #1  a=1; b=1;
  
 end

endmodule // testnandgate