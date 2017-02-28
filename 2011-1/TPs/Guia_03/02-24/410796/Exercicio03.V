// ---------------------------
// Guia_03 - Exercicio 3
// Nome: Marco Antonio M. Belo
// Matricula: 0410796
// ---------------------------


// ---------------------
// -- meia diferença
// ---------------------

module meia_diferenca(s0, s1, p, q);
 output s0, s1;
 input  p,q;
 wire temp1, temp2, temp3;
 
 xor  XOR1(s1, p, q);
 not  NOT1(temp1, q); 
 and  AND1(s0, temp1, p);
 
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
      $display("Exercico 3 - GUIA 03\nMarco Antonio M. Belo - 0410796\n");
      $display("Meia Diferença");
      $display("\na - b = s\n");
      $monitor("%b - %b = %b%b", b, a, s0, s1);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;

 end
endmodule 