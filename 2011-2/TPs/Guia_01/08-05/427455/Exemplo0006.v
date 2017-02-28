// ------------------------- 
// Exemplo0006 - NAND 
// Nome: Pedro Ballona 
// Matricula: 427455 
// ------------------------- 
 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s,  
                               input  p,  
                               input  q); 
 assign s = ~(p & q); 
endmodule // andgate 
 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
   reg   a, b; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   andgate NAND1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; 
   end 
  
// ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0003 - Pedro Ballona - 427455"); 
      $display("Test NAND gate"); 
      $display("\na & b = s\n"); 
      a=0; b=0; 
  #1  $display("%b & %b = %b", a, b, s); 
      a=0; b=1; 
  #1  $display("%b & %b = %b", a, b, s); 
      a=1; b=0; 
  #1  $display("%b & %b = %b", a, b, s); 
      a=1; b=1; 
  #1  $display("%b & %b = %b", a, b, s); 
 end 
 
endmodule // testandgate