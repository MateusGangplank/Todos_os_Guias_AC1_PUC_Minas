// ---------------------------
// Guia_03 - Exercicio 4
// Nome: Marco Antonio M. Belo
// Matricula: 0410796
// ---------------------------

// ---------------------
// -- or_nor gate
// ---------------------

module or_nor_gate (s, p, q);
 output s;
 input  p,q;
 wire temp1, temp2;
 
 nor NOR1(temp1, p, q);
 nor NOR2(temp2, q, p);
 nor NOR3(s, temp1, temp2);
 
endmodule 

// ---------------------
// -- and_nor gate
// ---------------------

module and_nor_gate (s, p, q);
 output s;
 input  p,q;
 wire temp1, temp2;
 
 nor NOR1(temp1, p, p);
 nor NOR2(temp2, q, q);
 nor NOR3(s, temp1, temp2);

endmodule 

// ---------------------
// -- not_nor gate
// ---------------------

module not_nor_gate (s, p);
 output s;
 input  p;
 
 nor NOR1(s, p, p);

endmodule 

// ---------------------
// -- meia soma
// ---------------------

module meia_soma (s0, s1, p, q);
 output s0, s1;
 input  p,q;
 wire temp1, temp2;
 
 or_nor_gate OR_NOR1(temp1, p, q);
 and_nor_gate AND_NOR1(s1, p, q); 
 not_nor_gate NOT_NOR1(temp2, s1);
 and_nor_gate AND_NOR2(s0, temp2,temp1);
 
endmodule 

// ---------------------
// -- test meia soma
// ---------------------

module meiasoma;
 reg   a, b;
 wire  s0, s1;
          // instancia
 meia_soma MS1(s1, s0, a, b);
 
 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Exercico 4 - GUIA 03\nMarco Antonio M. Belo - 0410796\n");
      $display("Meia Soma - NOR");
      $display("\na + b = s\n");
      $monitor("%b + %b = %b%b", a, b, s0, s1);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;

 end
endmodule // testxorgate