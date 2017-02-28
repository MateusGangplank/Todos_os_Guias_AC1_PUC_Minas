 // -------------------------------
// Guia 01_04 - XOR
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// ----------------------------
// -- XOR gate duas entradas
// ----------------------------

 module xorgate (s, p, q);
 output s;
 input  p, q;

 assign s = p ^ q;

endmodule // xorgate


// ---------------------
// -- test XOR gate
// ---------------------

module testxorgate;
 reg   a, b;
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b);
 
          // parte principal
 initial begin
      $display("\nguia01_04 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test XOR gate");
      $display("\na ^ b = s\n");
      a=0; b=0;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=0; b=1;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=1; b=0;
  #1  $display("%b ^ %b = %b", a, b, s);
      a=1; b=1;
  #1  $display("%b ^ %b = %b", a, b, s);
 end

endmodule // testxorgate

/*
RESULTADOS OBTIDOS

 ----jGRASP exec: vvp xor.vvp
    
    
    guia01_04 - Ludmily Caldeira da Silva - 417290
    
    Test XOR gate
    
    a ^ b = s
    
    0 ^ 0 = 0
    0 ^ 1 = 1
    1 ^ 0 = 1
    1 ^ 1 = 0
    
     ----jGRASP: operation complete.

  
*/


