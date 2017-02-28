 // -------------------------------
// Guia 03_05 - Meia diferença
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Meia diferença
// -------------------------------

module MeiaDiferenca (d, p, q);
 
output d, Vem1;
input  p, q;
wire temp[0:11];

nor NOR1 (temp[0], p);
nor NOR2 (temp[1], temp[0]);
nor NOR3 (temp[2], q);
nor NOR4 (temp[3], temp[1], temp[2]);
nor NOR5 (temp[4], q);
nor NOR6 (temp[5], temp[4]);
nor NOR7 (temp[6], p);
nor NOR8 (temp[7], temp[5], temp[6]);
nor NOR9 (temp[8], temp[3], temp[7]);
nor NOR10 (d, temp[8]);
nor NOR11 (temp[9], p);
nor NOR12 (temp[10], q);
nor NOR13 (temp[11], temp[9]);
nor NOR14 (Vem1, temp[10], temp[11]);

 endmodule // Meia diferenaa

// ---------------------
// -- test Meia diferença
// ---------------------

module TestMeiaDiferenca;

 reg   a, b;
 wire  d, Vem1, t[0:11];
 
// instancia

nor NOR1 (t[0], a);
nor NOR2 (t[1], t[0]);
nor NOR3 (t[2], b);
nor NOR4 (t[3], t[1], t[2]);
nor NOR5 (t[4], b);
nor NOR6 (t[5], t[4]);
nor NOR7 (t[6], a);
nor NOR8 (t[7], t[5], t[6]);
nor NOR9 (t[8], t[3], t[7]);
nor NOR10 (d, t[8]);
nor NOR11 (t[9], a);
nor NOR12 (t[10], b);
nor NOR13 (t[11], t[9]);
nor NOR14 (Vem1, t[10], t[11]);

// parte principal

 initial begin
      $display("\nguia03_05 - Ludmily Caldeira da Silva - 417290\n");
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

    guia03_05 - Ludmily Caldeira da Silva - 417290
    
    Test Meia diferenca
    
    
    a  b   d   Vem1
    
    0  0   0    0
    0  1   1    1
    1  0   1    0
    1  1   0    0
   	 
*/

