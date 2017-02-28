// ------------------------- 
// Exercicio1 - NAND 
// Nome: Felipe Ferreira Adnrade do Carmo 
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
// -- nand gate 
// ------------------------- 
module nandgate ( output s,input  p, input  q); 
 assign s = ~(p&q) ; 
endmodule // andgate 
 
// --------------------- 
// -- test nand gate 
// --------------------- 
module testnandgate; 
// ------------------------- dados locais 
   reg   a, b; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   nandgate AND1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; 
   end 
 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exercicio1- Felipe Ferreira Andrade do Carmo - 427402"); 
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