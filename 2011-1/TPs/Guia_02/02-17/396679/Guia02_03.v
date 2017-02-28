// ---------------------
// Guia02_03 - NOT
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
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
// -- not gate
// ---------------------

module notgate (s, p);
 output s;
 input  p;
 
 nandgate NAND1 (s,p);

endmodule // notgate 

// ---------------------
// -- test not gate
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
 initial begin:main
      $display("Guia02_01 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test NOT gate");
      $display("\n~a = s\n");
		$monitor("~%b = %b", a, s);
  #1  a=1;

 end

endmodule // testnotgate
