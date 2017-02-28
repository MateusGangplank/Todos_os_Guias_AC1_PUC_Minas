 // -------------------------------
// Guia 03_02 - Meia soma
// Nome: Jessica Luisa Betonico Andrade
// Matricula: 412748
// --------------------------------

// -------------------------------
// -- MEIA SOMA FEITA POR NANDS
// -------------------------------

module MeiaSoma (s, p, q);
 
output s, s0;
input  p, q;
wire temp, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;

nand NAND1 (temp, p);
nand NAND2 (temp1, temp, q);
nand NAND3 (temp2, temp1);
nand NAND4 (temp3, temp2);
nand NAND5 (temp4, q);
nand NAND6 (temp5, p, temp4);
nand NAND7 (temp6, temp5);
nand NAND8 (temp7, temp6);
nand NAND9 (s, temp7, temp3);
nand NAND10 (temp8, p, q);
nand NAND11 (s0, temp8);

 endmodule // Meia soma

// ---------------------
// -- test Meia soma
// ---------------------

module Testandomsoma;

 reg   a, b;
 wire  s, s0, tmp, tmp1, tmp2,  tmp3, tmp4, tmp5, tmp6, tmp7, tmp8;
 
// instancia

nand NAND1 (tmp, a);
nand NAND2 (tmp1, tmp, b);
nand NAND3 (tmp2, tmp1);
nand NAND4 (tmp3, tmp2);
nand NAND5 (tmp4, b);
nand NAND6 (tmp5, a, tmp4);
nand NAND7 (tmp6, tmp5);
nand NAND8 (tmp7, tmp6);
nand NAND9 (s, tmp7, tmp3);
nand NAND10 (tmp8, a, b);
nand NAND11 (s0, tmp8);

// parte principal

 initial begin
      $display("GUIA 3_2 - jessica Luisa Betonico Andrade - 412748");
      $display("TESTE MEIA SOMA");
      $display("\na  \t b  \t s0  \t  s\n");
      $monitor("  %b \t+  \t%b   \t%b    \t%b", a, b, s0, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // Testandomsoma

