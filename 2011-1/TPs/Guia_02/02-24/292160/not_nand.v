// ---------------------
// Guia 02 - Exercício 03
// Nome: Luiz Guilherme Andrade Menezes
// Matricula: 292160
// ---------------------

// ---------------------
// -- porta not com porta nand
// ---------------------

module notnandgate (s, p);
 output s;
 input  p;
  
 assign s = ~(p & p); 

endmodule // notnandgate

// ---------------------
// -- test notnand gate
// ---------------------

module testnotnandgate;
 reg   a;
 wire  s;
          // instancia
 notnandgate XOR1 (s, a);
 
          // parte principal
 initial begin
      $display("Guia 02 - Exercício 03 - Luiz Menezes - 292160");
      $display("notnandgate gate");
      $display("\n~(a & a) = s\n");
		$monitor("~(%b & %b) = %b", a, a, s);
    	a=0;
 #1	a=1;

 end

endmodule // testnotnandgate
