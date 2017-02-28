// ------------------------- 
// Exercicio2 - NOR 
// Nome: Felipe Ferreira Andrade do Carmo 
// Matricula: 427402
// ------------------------- 
 
// ------------------------- 
// -- nor gate 
// ------------------------- 
module orportao( output s,input p, q); 
 assign s =  ~(p|q) ; 
endmodule // orgate 
 
// --------------------- 
// -- test nor gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
   reg   a, b; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   orportao OR1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; 
   end 
 
 
// ------------------------- parte principal 
 
   initial begin 
      $display("Exercicio2 - Felipe Ferreira - 427402"); 
      $display("Test NOR gate"); 
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