// ---------------------------
// Guia 04 - Exercicio 5
// Nome: Marco Antonio M. Belo
// Matricula: 410796
// ---------------------------

// ---------------------------
// -- Meia Difenca com Nand
// ---------------------------

module meia_diferenca(v, d, p, q);
 output v, d;
 input  p,q;
 wire temp1, temp2, temp3, temp4, temp5, temp6;
 
// -- Not
nand NAND1(temp1, p, p);

// -- And
nand NAND2(temp2, temp1, q);
nand NAND3(temp3, temp1, q);
nand NAND4(v, temp2, temp3);

// -- Xor
nand NAND5(temp4, p, q);
nand NAND6(temp5, temp4, q);
nand NAND7(temp6, temp4, p);
nand NAND8(d, temp6, temp5);

endmodule 

// ---------------------------
// -- Diferença completa
// ---------------------------

module diferenca(s0, s1, x, y, vem_um);
 output s0, s1;
 input  x,y,vem_um;
 wire temp1, temp2, temp3, temp4, temp5, temp6;
 
meia_diferenca MD1(temp2, temp1, x, y);
meia_diferenca MD2(temp3, s0, temp1, vem_um);
nand NAND1(temp4, temp3, temp3);
nand NAND1(temp5, temp2, temp2);
nand NAND1(s1, temp5, temp4);

endmodule 

// ---------------------
// -- test 
// ---------------------

module test;
 reg   a, b,c;
 wire  s0, s1;
          // instancia
 diferenca MD1(s1, s0, a, b, c);
 
 initial begin:start
      a=0; b=0; c=0; 
 end

          // parte principal
 initial begin:main
      $display("Exercico 5 - GUIA 04\nMarco Antonio M. Belo - 410796\n");
      $display("Difernça com Nand");
      $display("\na - b - c = s\n");
      $monitor("%b - %b - %b = %b", a, b, c,s0, s1);
  #1  a=0; b=0; c=1; 
  #1  a=0; b=1; c=0; 
  #1  a=0; b=1; c=1; 
  #1  a=1; b=0; c=0; 
  #1  a=1; b=0; c=1; 
  #1  a=1; b=1; c=0; 
  #1  a=1; b=1; c=1; 
  
 end
endmodule // testxorgate