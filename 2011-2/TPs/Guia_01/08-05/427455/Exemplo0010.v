// ------------------------- 
// Exemplo0010 - OR 
// Nome: Pedro Ballona 
// Matricula: 427455 
// ------------------------- 
 
// ------------------------- 
// -- or gate 
// ------------------------- 
module orgate ( output s, 
                            input   p, q , r); 
 assign s = ~(~p & ~q & ~r); 
endmodule // orgate 
 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
   reg   a, b , c; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   orgate OR1 (s, a, b ,c); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; c=0; 
   end 
 
 // ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0010 - Pedro Ballona - 427455"); 
      $display("Test OR gate"); 
      a=0; b=0; c=0; 
  #1  $display("%b & %b & %b = %b", a, b, c, s);
  		a=0; b=0; c=1; 
  #1  $display("%b & %b & %b = %b", a, b, c, s);
  		a=0; b=1; c=0; 
  #1  $display("%b & %b & %b = %b", a, b, c, s); 
  		a=0; b=1; c=1; 
  #1  $display("%b & %b & %b = %b", a, b, c, s); 
  		a=1; b=0; c=0; 
  #1  $display("%b & %b & %b = %b", a, b, c, s); 
  		a=1; b=0; c=1; 
  #1  $display("%b & %b & %b = %b", a, b, c, s); 
  		a=1; b=1; c=0; 
  #1  $display("%b & %b & %b = %b", a, b, c, s); 
  		a=1; b=1; c=1; 
  #1  $display("%b & %b & %b = %b", a, b, c, s);

 end 
 
endmodule // testorgate 