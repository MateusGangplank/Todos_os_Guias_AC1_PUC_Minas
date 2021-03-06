// ---------------------
// Guia 02 - Exerc�cio 02
// Nome: Luiz Guilherme Andrade Menezes
// Matricula: 292160
// ---------------------

// ---------------------
// -- porta and com porta nor
// ---------------------

module ornandgate (s, p, q);
 output s;
 input  p, q;
 wire tem1, tem2;
  
 assign tem1 = ~(p & p);           // USAR AS DEFINICOES DE PORTAS !
 assign tem2 = ~(q & q);
 assign s = ~(tem1 & tem2); 

endmodule // ornandgate

// ---------------------
// -- test ornand gate
// ---------------------

module testornandgate;
 reg   a, b;
 wire  s;
          // instancia
 ornandgate XOR1 (s, a, b);
 
          // parte principal
 initial begin
      $display("Guia 02 - Exerc�cio 02 - Luiz Menezes - 292160");
      $display("ornandgate gate");
      $display("\n~(~a & ~b) = s\n");
		$monitor("~(~%b & ~%b) = %b", a, b, s);
    	a=0; b=0;
 #1	a=0; b=1;
 #1	a=1; b=0;
 #1	a=1; b=1;
 end

endmodule // testornandgate
