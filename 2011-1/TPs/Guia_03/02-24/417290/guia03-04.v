 // -------------------------------
// Guia 03_04 - Meia soma
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Meia soma
// -------------------------------

module MeiaSoma (s, p, q);
 
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
 wire  s, Vout, t[0:10];
 
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
nor NOR10 (s, t[8]);
nor NOR11 (t[9], b);
nor NOR12 (t[10], a);
nor NOR13 (Vout, t[9], t[10]);

// parte principal

 initial begin
      $display("\nguia03_04 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Meia soma\n");
      $display("\na  b  Vout  s\n");
      $monitor("%b  %b   %b    %b", a, b, Vout, s);
  
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

