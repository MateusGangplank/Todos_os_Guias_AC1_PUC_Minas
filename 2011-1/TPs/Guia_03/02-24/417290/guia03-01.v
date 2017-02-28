 // -------------------------------
// Guia 03_01 - Meia soma
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// -------------------------------
// -- Meia soma
// -------------------------------

module MeiaSoma (s, p, q);
 
output s, Vout;
input  p, q;
wire temp1, temp2;

and AND1 (Vout, p, q);
and AND2 (temp1, ~p, q);
and AND3 (temp2, p, ~q);
or Or1 (s, temp1, temp2);

 endmodule // Meia soma

// ---------------------
// -- test Meia soma
// ---------------------

module TestMeiaSoma;

 reg   a, b;
 wire  s, t, t1, t2;
 
// instancia

and AND1 (t, a, b);
and AND2 (t1, ~a, b);
and AND3 (t2, a, ~b);
or  OR1 (s, t1, t2);// parte principal

 initial begin
      $display("\nguia03_01 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test Meia soma\n");
      $display("\na  b  Vout  s\n");
      $monitor("%b  %b   %b    %b", a, b, t, s);
  
	     a=0; b=0;
    #1  a=0; b=1; 
    #1  a=1; b=0;
    #1  a=1; b=1; 
  
    end
 
endmodule // TestMeiaSoma

/* Resultados obtidos

    guia02_01 - Ludmily Caldeira da Silva - 417290
    
    Test Meia soma
    
    
    a  b  Vout  s
    
    0  0   0    0
    0  1   0    1
    1  0   0    1
    1  1   1    0
    
 
*/

