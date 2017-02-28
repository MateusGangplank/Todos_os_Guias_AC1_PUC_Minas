// ---------------------
// Guia 04_02 - Soma Completa com meia soma
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

// ---------------------
// -- meia soma
// ---------------------

module meiasoma (s0, s1, a, b);

 output s0, s1;
 input  a, b;
 
xor XOR1 (s0, a, b);
and AND1 (s1, a, b);
 
 endmodule //meiasoma
 
// ---------------------
// -- module soma completa
// ---------------------

module somacompleta(s0, s1, a, b, v);

wire q0,q1,q2;
output s0, s1;
input a, b, v;

meiasoma MS1 (q0, q1, a, b);
meiasoma MS2 (s0, q2, q0, v);
or OR1 (s1, q1, q2);

endmodule // soma completa

// --------------------------
// -- test soma completa
// --------------------------

module testsomacompleta;
 reg   a, b, v;             
 wire  s0, s1;
          // instancia
 somacompleta SOMACOMPLETA1 (s0, s1, a, b, v);

 initial begin:start
      a=0; b=0; v=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04_02 - Anderson Belchior de Carvalho - 396673");
      $display("Operador Soma-Completa usando dois circuitos Meia-Soma.");
      $display("\nv a b = s0 s1\n");
      $monitor(" %b %b %b = %b %b", v, a, b, s0, s1);
#1 a=0;b=1;v=0;
#1 a=1;b=0;v=0;
#1 a=1;b=1;v=0;
#1 a=0;b=0;v=1;
#1 a=0;b=1;v=1;
#1 a=1;b=0;v=1;
#1 a=1;b=1;v=1;
  
 end

endmodule // testmeiadiferenca