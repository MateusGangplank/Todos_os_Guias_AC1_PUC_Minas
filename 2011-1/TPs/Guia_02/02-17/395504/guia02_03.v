// ---------------------
// Guia 02_01 
// Nome: Thaise Souto Martins
// Matricula: 395504
// ---------------------


// ---------------------
// -- nand gate 
// ---------------------

module nandgate (s, p);
 output s;
 input  p;

 assign s = ~(p & p);

endmodule // nandgate


// ---------------------
// -- not gate with nand
// ---------------------

module notgate (s0, p);
 output s0;
 input  p;
 
 nandgate NAND1(s0,p);

 
endmodule // notgate


// --------------------------
// -- test not gate with nand
// --------------------------

module testnotgate;
 reg   a;             
 wire  s;
          // instancia
 notgate NOT1 (s, a);

 initial begin:start
      a=0; 
 end

          // parte principal
 initial begin:main
      $display("Guia 02_03 - Thaise Souto Martins - 395504");
      $display("Test NOT gate");
      $display("\n~a = s\n");
      $monitor("~%b = %b", a, s);
  #1  a=1; 
  
 end

endmodule // testnotgate
