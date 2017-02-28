// ---------------------
// GUIA 02 
// Nome: Luiz Marques de Oliveira
// Matricula: 417138
// ---------------------

// ---------------------
// -- AND GATE FEITA DE NOR
// --------------------	-

module Andgate (s, p, q);
 output s;
 input  p, q, r;
wire temp1, temp2;
 
 nor NOR1 (temp1, p);
 nor MOR2 (temp2, q);

 assign s = ~(temp1 | temp2);       // TENTE USAR APENAS PORTAS
 
 endmodule // Andgate
 


// ---------------------
// -- test And gate
// ---------------------

module testANDgate;
 reg   a,b;
 wire  s;
 
          // instancia
			 
 Andgate AND1  (s, a, b);

 
   // parte principal
 initial begin
      $display("Guia 02-Exercicio 2 ||| Luiz Marques de Oliveira || 417138");
      $display("Test AND gate feita com NOR");
      $display("\n (a&b)=s \n");
      $monitor("(%b & %b) = %b", a, b, s);
  
     a=0; b=0;
  #1 a=0; b=1;
  #1 a=1; b=0;
  #1 a=1; b=0;
  
 end

endmodule // testAndgate
