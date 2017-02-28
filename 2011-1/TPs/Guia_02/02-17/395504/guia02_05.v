// ---------------------
// Guia 02_05 - AND
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
// -- nand gate
// ---------------------

module nandgate (s0, p, q);
 output s0;
 wire s1,s2,s3;
 input  p,q;

 norgate NORGATE1 (s1,p,p);
 norgate NORGATE2 (s2,q,q);
 norgate NORGATE3 (s3,s1,s2);
 norgate NORGATE4 (s0,s3,s3);
 
endmodule // nandgate


// ---------------------
// -- test nand gate
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
      $display("Guia 02_05 - Thaise Souto Martins - 395504");
      $display("Test NAND gate");
      $display("\na & b = s\n");
      $monitor("%b & %b = %b", a, b, s);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testandgate
