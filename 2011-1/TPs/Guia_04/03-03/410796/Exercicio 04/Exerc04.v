// ---------------------------
// Guia 04 - Exercicio 4
// Nome: Marco Antonio M. Belo
// Matricula: 410796
// ---------------------------

// ---------------------------
// -- Meia Difenca com Nor
// ---------------------------

module meia_diferenca(s0, s1, p, q);
 output s0, s1;
 input  p,q;
 wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;
 
// -- Not
nor NOR1(temp1, p, p);

// -- And
nor NOR2(temp2, temp1, temp1);
nor NOR3(temp3, q, q);
nor NOR4(s1, temp3, temp2);

// -- Xor
nor NOR5(temp5, p, p);
nor NOR6(temp6, q, q);
nor NOR7(temp7, temp6, temp5);
nor NOR8(temp8, q, p);
nor NOR9(s0, temp8, temp7);
 
endmodule 

// ---------------------
// -- test 
// ---------------------

module test;
 reg   a, b;
 wire  s0, s1;
          // instancia
 meia_diferenca MD1(s1, s0, a, b);
 
 initial begin:start
      a=0; b=0; 
 end

          // parte principal
 initial begin:main
      $display("Exercico 4 - GUIA 04\nMarco Antonio M. Belo - 410796\n");
      $display("Meia Difernça com Nor");
      $display("\na - b = s\n");
      $monitor("%b - %b = %b", a, b,s0, s1);
  #1  a=0; b=1; 
  #1  a=1; b=0; 
  #1  a=1; b=1; 
  
 end
endmodule // testxorgate