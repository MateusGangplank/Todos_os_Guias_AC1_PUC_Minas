// ---------------------
// Guia 02 - Exercício 01
// Nome: Luiz Guilherme Andrade Menezes
// Matricula: 292160
// ---------------------

// ---------------------
// -- porta or com porta nand
// ---------------------

module orandgate (s, p, q);
 output s;
 input  p, q;
 wire tem1, tem2;
  
 assign tem1 = ~(p | p);
 assign tem2 = ~(q | q);
 assign s = ~(tem1 | tem2); 

endmodule // orandgate

// ---------------------
// -- test orand gate
// ---------------------

module testorandgate;
 reg   a, b;
 wire  s;
          // instancia
 orandgate XOR1 (s, a, b);
 
          // parte principal
 initial begin
      $display("Guia 02 - Exercício 01 - Luiz Menezes - 292160");
      $display("orandgate gate");
      $display("\n~(~a | ~b) = s\n");
		$monitor("~(~%b | ~%b) = %b", a, b, s);
    	a=0; b=0;
 #1	a=0; b=1;
 #1	a=1; b=0;
 #1	a=1; b=1;
 end

endmodule // testornandgate
