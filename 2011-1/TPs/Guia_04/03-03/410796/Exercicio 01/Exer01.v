// ---------------------------
// Guia 04 - Exercicio 1
// Nome: Marco Antonio M. Belo
// Matricula: 410796
// ---------------------------

// ---------------------
// -- Half Adder - NAND
// ---------------------

module half_adder(s0, s1, p, q);
 output s0, s1;
 input  p,q;
 wire temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;
 
//-- or gate
nand NAND1(temp1, p,p);
nand NAND2(temp2, q,q);
nand NAND3(temp3, temp1,temp2);

//-- and gate
nand NAND4(temp4, p,q);
nand NAND5(temp5, p,q);
nand NAND6(s1, temp4,temp5);

//-- not gate
nand NAND7(temp6, s1,s1);

//-- and gate
nand NAND8(temp7, temp6,temp3);
nand NAND9(temp8, temp6,temp3);
nand NAND10(s0, temp7,temp8);
 
endmodule 

// ---------------------
// -- test half adder
// ---------------------

module test;
 reg   a, b;
 wire  s0, s1;
          // instancia
 half_adder HA1(s1, s0, a, b);
 
 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Exercico 1 - GUIA 04\nMarco Antonio M. Belo - 410796\n");
      $display("Half Adder");
      $display("\na + b = s\n");
      $monitor("%b + %b = %b%b", a, b, s0, s1);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;

 end
endmodule // testxorgate