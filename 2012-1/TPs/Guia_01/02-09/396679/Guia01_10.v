// ---------------------
// Guia01_10 - OR com 3 entradas usando modulo com 2 entradas
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- or gate
// ---------------------

module orgate (s, p, q);
 output s;
 input  p, q;

 assign s = (p | q);

endmodule // orgate

// ---------------------
// -- or3 gate
// ---------------------

module or3gate (s, p, q, r);
 output s;
 input  p, q, r;
 wire s1;

 orgate OR1 (s1, p, q);
 orgate OR2 (s, r, s1);
 
endmodule // or3gate

// ---------------------
// -- test or gate
// ---------------------

module testorgate;
 reg   a, b, c;
 wire  s;
          // instancia
 or3gate OR1 (s, a, b, c);
          // parte principal
 initial begin
      a=0; b=0; c=0;
      $display("Guia01_10 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test OR gate");
      $display("\n(a & b & c) = s\n");
		$monitor("(%b & %b & %b)= %b", a, b, c, s);
 #1   a=0; b=0; c=1;
 #1   a=0; b=1; c=0;
 #1   a=0; b=1; c=1;
 #1   a=1; b=0; c=0;
 #1   a=1; b=0; c=1;
 #1   a=1; b=1; c=0;
 #1   a=1; b=1; c=1;
 end

endmodule // testorgate