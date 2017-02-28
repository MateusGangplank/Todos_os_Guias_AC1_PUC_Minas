 // -------------------------------
// Guia 03_04 - Meia soma
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Meia soma
// -------------------------------

module MeiaSoma (s, Vout, p, q);
 
output s, Vout;
input  p, q;
wire temp[0:10];

nor NOR1 (temp[0], p);
nor NOR2 (temp[1], temp[0]);
nor NOR3 (temp[2], q);
nor NOR4 (temp[3], temp[1], temp[2]);
nor NOR5 (temp[4], q);
nor NOR6 (temp[5], temp[4]);
nor NOR7 (temp[6], p);
nor NOR8 (temp[7], temp[5], temp[6]);
nor NOR9 (temp[8], temp[3], temp[7]);
nor NOR10 (s, temp[8]);
nor NOR11 (temp[9], q);
nor NOR12 (temp[10], p);
nor NOR13 (Vout, temp[9], temp[10]);

 endmodule // Meia soma

// ---------------------
// -- test Meia soma
// ---------------------

module TestMeiaSoma;

reg   a, b;
wire  s1, Vout1;
 
// instancia

MeiaSoma Ms1 (s1, Vout1, a, b);

// parte principal

 initial begin
      $display("\nguia03_04 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Meia soma\n");
      $display("\na  b  Vout  s\n");
      $monitor("%b  %b   %b    %b", a, b, Vout1, s1);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // testOrgate

/* Resultados obtidos

    guia03_04 - Ludmily Caldeira da Silva - 417290
    
    Test Meia soma
    
    
    a  b  Vout  s
    
    0  0   0    0
    0  1   0    1
    1  0   0    1
    1  1   1    0

    
*/

