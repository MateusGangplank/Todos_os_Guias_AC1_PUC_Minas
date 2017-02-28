// ---------------------
// Guia 02_03 - NOT
// Nome: Heitor Terozendi
// Matricula: 396698
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

module nandgate (s, p);
 output s;
 input  p;
 
 assign s = ~( p & p);

endmodule // nandgate

// ---------------------
// -- not gate with nand
// ---------------------

module notgate (s, p);
 output s;
 input  p;
 
 nandgate NAND1 (s,p);

endmodule // notgate 


// ---------------------
// -- test and gate with nor
// ---------------------

module testnotgate;
 reg   a;
 wire  s;
          // instancia
 notgate NOT1 (s, a);
 
  initial begin:start
      a=0;
 end
 
          // parte principal
 initial begin
      $display("Guia 02_03 - Heitor Terozendi - 396698");
      $display("Test NOT gate");
      $display("\n~a = s\n");
      $monitor("~%b = %b", a, s);
  #1  a=1;
  
 end

endmodule // testnotgate