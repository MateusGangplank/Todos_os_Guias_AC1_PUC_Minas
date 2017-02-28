// ---------------------
// Guia 03_01 - Half Adder
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- half adder
// ---------------------

module halfadder (s0, s1, a, b);
 output s0,s1;
 input  a, b;
 
  xor XOR1 (s0,a,b);           // NAO ERA PARA USAR O MODELO COMPACTO NESTE EXERCICIO
  and AND1 (s1,a,b);

endmodule // halfadder

// ---------------------
// -- test halfadder
// ---------------------

module testorgate;
 reg   a,b;
 wire  s0,s1;
          
			 // instancia
 halfadder HA1 (s0,s1,a,b);
 
 initial begin:start
      a=0; b=0;
 end
          // parte principal
 initial begin:main
      $display("Guia 03_01 - Alyson Deives - 416589");
      $display("HALF ADDER\n");
		$display("\nA + B = S\n");
      $monitor("%b + %b = %b%b", a, b, s1,s0);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
  end

endmodule // testhalfadder