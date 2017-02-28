// ---------------------
// Guia01_09 - AND com 3 entradas usando modulo com 2 entradas
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module andgate (s, p, q);
 output s;
 input  p, q;

 assign s = (p & q);

endmodule // andgate

// ---------------------
// -- and3 gate
// ---------------------

module and3gate (s, p, q, r);
 output s;
 input  p, q, r;
 wire s1;

 andgate AND1 (s1, p, q);
 andgate AND2 (s, r, s1);
 
endmodule // and3gate

// ---------------------
// -- test and gate
// ---------------------

module testandgate;
 reg   a, b, c;
 wire  s;
          // instancia
 and3gate AND1 (s, a, b, c);
          // parte principal
 initial begin
      a=0; b=0; c=0;
      $display("Guia01_09 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test AND gate");
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

endmodule // testandgate