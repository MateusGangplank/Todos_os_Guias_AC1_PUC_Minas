// ---------------------
// Guia 02_04 
// Nome: Thaise Souto Martins
// Matricula: 395504
// ---------------------


// ---------------------
// -- nand gate 
// ---------------------

module nandgate (s, p, q);
 output s;
 input  p, q;

 assign s = ~(p & q);

endmodule // nandgate


// ---------------------
// -- nor gate with nand
// ---------------------

module norgate (s0, p, q);
 output s0;
 wire s1, s2,s3;
 input  p, q;

 nandgate NAND1 (s1, p, p);
 nandgate NAND2 (s2, q, q);
 nandgate NAND3 (s3, s1, s2);
 nandgate NAND4 (s0,s3,s3);

endmodule // orgate


// --------------------------
// -- test nor gate with nand
// --------------------------

module testnorgate;
 reg   a, b;             
 wire  s;
          // instancia
 norgate NOR1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 02_04 - Thaise Souto Martins - 395504");
      $display("Test NOR gate");
      $display("\na & b = s\n");
      $monitor("%b & %b = %b", a, b, s);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end

endmodule // testorgate
