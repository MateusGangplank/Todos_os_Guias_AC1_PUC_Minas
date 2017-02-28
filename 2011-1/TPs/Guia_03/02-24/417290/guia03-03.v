 // -------------------------------
// Guia 03_03 - Meia diferença
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Meia diferença
// -------------------------------

module MeiaDiferenca (d, p, q);
 
output d, Vem1;
input  p, q;
wire temp[0:9];

nand NAND1 (temp[0], p);
nand NAND2 (temp[1], temp[0], q);
nand NAND3 (temp[2], temp[1]);
nand NAND4 (temp[3], temp[2]);
nand NAND5 (temp[4], q);
nand NAND6 (temp[5], p, temp[4]);
nand NAND7 (temp[6], temp[5]);
nand NAND8 (temp[7], temp[6]);
nand NAND9 (d, temp[7], temp[3]);
nand NAND10 (temp[8], p);
nand NAND11 (temp[9], temp[8], q);
nand NAND12 (Vem1, temp[9]);

 endmodule // Meia diferenaa

// ---------------------
// -- test Meia diferença
// ---------------------

module TestMeiaDiferenca;

 reg   a, b;
 wire  d, Vem1, t[0:9];
 
// instancia

nand NAND1 (t[0], a);
nand NAND2 (t[1], t[0], b);
nand NAND3 (t[2], t[1]);
nand NAND4 (t[3], t[2]);
nand NAND5 (t[4], b);
nand NAND6 (t[5], a, t[4]);
nand NAND7 (t[6], t[5]);
nand NAND8 (t[7], t[6]);
nand NAND9 (d, t[7], t[3]);
nand NAND10 (t[8], a);
nand NAND11 (t[9], t[8], b);
nand NAND12 (Vem1, t[9]);

// parte principal

 initial begin
      $display("\nguia03_03 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Meia diferenca\n");
      $display("\na  b   d   Vem1\n");
      $monitor("%b  %b   %b    %b", a, b, d, Vem1);
  
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

