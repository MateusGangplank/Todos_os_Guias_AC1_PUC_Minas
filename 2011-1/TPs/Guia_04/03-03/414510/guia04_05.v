// ---------------------
// Guia 04_05 - Diferenca Completa usando meia diferenca com NAND
// Nome: Marley Ribeiro
// Matricula: 414510
// ---------------------

// ---------------------
// -- meia diferenca com nand
// ---------------------

module meiadiferenca (s0, s1, a, b);
 output s0, s1;
 input  a, b;
 wire s2,s3,s4,s5,s6,s7;
 
 nand nandgate1 (s2, a, b);
 nand nandgate7 (s6, a, a);
 nand nandgate2 (s7, s6, b);
 nand nandgate8 (s1, s7, s7);
 nand nandgate3 (s3, a, b);
 nand nandgate4 (s4, a, s3);
 nand nandgate5 (s5, s3, b);
 nand nandgate6 (s0, s4, s5);

endmodule // meia diferenca

// ---------------------
// -- module diferenca completa
// ---------------------

module diferencacompleta(s0, s1, a, b, v);

wire q0,q1,q2;
output s0, s1;
input a, b, v;

meiadiferenca MD1 (q0, q1, a, b);
meiadiferenca MD2 (s0, q2, v, q0);
or OR1 (s1, q1, q2);

endmodule // diferenca completa

// --------------------------
// -- test diferenca completa
// --------------------------

module testdiferencacompleta;
 reg   a, b, v;             
 wire  s0, s1;
          // instancia
 diferencacompleta DIFERENCACOMPLETA1 (s0, s1, a, b, v);

 initial begin:start
      a=0; b=0; v=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 04_03 - Marley Ribeiro - 414510");
      $display("Operador Diferenca-Completa usando dois circuitos Meia-Diferenca.");
      $display("\nv a b = s1 s0\n");
      $monitor(" %b %b %b = %b %b", v, a, b, s1, s0);
#1 a=0;b=1;v=0;
#1 a=1;b=0;v=0;
#1 a=1;b=1;v=0;
#1 a=0;b=0;v=1;
#1 a=0;b=1;v=1;
#1 a=1;b=0;v=1;
#1 a=1;b=1;v=1;
  
 end

endmodule // testdiferencacompleta