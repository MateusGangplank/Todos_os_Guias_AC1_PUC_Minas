 // -------------------------------
// Guia 03_02 - Meia soma
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Meia soma
// -------------------------------

module MeiaSoma (s, p, q);
 
output s, Vout;
input  p, q;
wire temp[0:8];

nand NAND1 (temp[0], p);
nand NAND2 (temp[1], temp[0], q);
nand NAND3 (temp[2], temp[1]);
nand NAND4 (temp[3], temp[2]);
nand NAND5 (temp[4], q);
nand NAND6 (temp[5], p, temp[4]);
nand NAND7 (temp[6], temp[5]);
nand NAND8 (temp[7], temp[6]);
nand NAND9 (s, temp[7], temp[3]);
nand NAND10 (temp[8], p, q);
nand NAND11 (Vout, temp[8]);

 endmodule // Meia soma

// ---------------------
// -- test Meia soma
// ---------------------

module TestMeiaSoma;

 reg   a, b;
 wire  s, Vout, t[0:8];
 
// instancia

nand NAND1 (t[0], a);
nand NAND2 (t[1], t[0], b);
nand NAND3 (t[2], t[1]);
nand NAND4 (t[3], t[2]);
nand NAND5 (t[4], b);
nand NAND6 (t[5], a, t[4]);
nand NAND7 (t[6], t[5]);
nand NAND8 (t[7], t[6]);
nand NAND9 (s, t[7], t[3]);
nand NAND10 (t[8], a, b);
nand NAND11 (Vout, t[8]);

// parte principal

 initial begin
      $display("\nguia03_02 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Meia soma\n");
      $display("\na  b  Vout  s\n");
      $monitor("%b  %b   %b    %b", a, b, Vout, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // TestMeiaSoma

/* Resultados obtidos

    guia03_02 - Ludmily Caldeira da Silva - 417290  
	 
	 Test Meia soma
    
    
    a  b  Vout  s
    
    0  0   0    0
    0  1   0    1
    1  0   0    1
    1  1   1    0

    
*/

