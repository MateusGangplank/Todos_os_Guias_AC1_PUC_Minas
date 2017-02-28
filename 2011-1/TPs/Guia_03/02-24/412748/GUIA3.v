 // -------------------------------
// Guia 03_03 - Meia diferença
// Nome: Jessica Luisa Betonico Andrade
// Matricula: 412748
// --------------------------------

// -------------------------------
// -- Meia diferença
// -------------------------------

module MeiaDiferenca (s, p, q);
 
output s, s1;
input  p, q;
wire temp, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9;

nand NAND1 (temp, p);
nand NAND2 (temp1, temp, q);
nand NAND3 (temp2, temp1);
nand NAND4 (temp3, temp2);
nand NAND5 (temp4, q);
nand NAND6 (temp5, p, temp4);
nand NAND7 (temp6, temp5);
nand NAND8 (temp7, temp6);
nand NAND9 (s, temp7, temp3);
nand NAND10 (temp8, p);
nand NAND11 (temp9, temp8, q);
nand NAND12 (s1, temp9);

 endmodule // Meia diferença

// ---------------------
// -- test Meia diferença
// ---------------------

module TestMeiaDiferenca;

 reg   a, b;
 wire  s1, s0, tmp, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9;
 
// instancia

nand NAND1 (tmp, a);
nand NAND2 (tmp1, tmp, b);
nand NAND3 (tmp2, tmp1);
nand NAND4 (tmp3, tmp2);
nand NAND5 (tmp4, b);
nand NAND6 (tmp5, a, tmp4);
nand NAND7 (tmp6, tmp5);
nand NAND8 (tmp7, tmp6);
nand NAND9 (s1, tmp7, tmp3);
nand NAND10 (tmp8, a);
nand NAND11 (tmp9, tmp8, b);
nand NAND12 (s0, tmp9);

// parte principal

 initial begin
      $display("\nguia03_03 - Jessica Luisa Betonico Andrade - 412748\n");
      $display("Test Meia diferenca\n");
      $display("\na  \t b \t  s1 \t  s0\n");
      $monitor("%b  + \t %b \t  %b  \t  %b", a, b, s1, s0);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // testMeiaDiferenca

/* Resultados obtidos

    guia03_03 - Ludmily Caldeira da Silva - 417290
    
    Test Meia diferença
    
    
    a  b   d   Vem1
    
    0  0   0    0
    0  1   1    1
    1  0   1    0
    1  1   0    0  
	 
*/

