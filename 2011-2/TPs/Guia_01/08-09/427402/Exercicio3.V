// ------------------------- 
// Exemplo0004 - XNOR 
// Nome: Felipe Ferreira Andrade do Carmo 
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
// -- xnor gate 
// ------------------------- 
module xnorportao( output s,input p, q); 
 assign s = ~(p^q) ; 
endmodule // xnorgate 
 
// --------------------- 
// -- test or gate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
   reg   a, b; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   xnorportao OR1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; 
   end 
 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exercicio3 - Felipe Ferreira - 427402"); 
      $display("Test XNOR gate"); 
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
 
endmodule // testorgate 