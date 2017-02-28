// ---------------------------
// Guia_03 - Exercicio 5
// Nome: Marco Antonio M. Belo
// Matricula: 0410796
// ---------------------------


// ---------------------
// -- not_nor_gate
// ---------------------

module not_nor_gate(s, p);
 output s;
 input  p;
 
 nor NOR1(s, p, p);
 
endmodule 

// ---------------------
// -- and_nor_gate
// ---------------------

module and_nor_gate(s, p, q);
 output s;
 input  p, q;
 wire temp1, temp2;
 
 nor NOR1(temp1, p, p);
 nor NOR2(temp2, q, q);
 nor NOR3(s, temp1, temp2);
 
endmodule 

// ---------------------
// -- xor_nor_gate
// ---------------------

module xor_nor_gate(s, p, q);
 output s;
 input  p, q;
 wire temp1, temp2, temp3, temp4;
 
 nor NOR1(temp1, p, q);
 nor NOR2(temp2, p, q);
 nor NOR3(temp3, p, q);
 nor NOR2(temp4, temp1, temp2);
 nor NOR3(s, temp4, temp3);
 
endmodule 

// ---------------------
// -- meia_diferença
// ---------------------

module meia_diferenca(s0, s1, p, q);
 output s0, s1;
 input  p, q;
 wire temp1, temp2;
 
 xor_nor_gate XOR1(s0, p, q);
 not_nor_gate NOT1(temp2, p);
 and_nor_gate AND1(s1, q, temp2);

 
endmodule 

// ---------------------
// -- test meia difença
// ---------------------

module test_meia_diferenca;
 reg   a, b;
 wire  s0, s1;
          // instancia
 meia_diferenca MD1(s0, s1, a, b);
 
 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Exercico 5 - GUIA 03\nMarco Antonio M. Belo - 0410796\n");
      $display("Meia Diferença");
      $display("\na - b = s\n");
      $monitor("%b - %b = %b%b", b, a, s0, s1);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;

 end
endmodule 