 
// ------------------------- 
// Exemplo0008 - XNOR 
// Nome: Mateus Augusto Moraes Ferreira
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
// -- xnor gate 
// ------------------------- 
module xnorgate ( output s, 
                            input   p, q); 
 assign s = ( ~(p^q) ); 
endmodule // xnorgate 
 
// --------------------- 
// -- test xnor gate 
// --------------------- 
module testxnorgate; 
// ------------------------- dados locais 
   reg   a, b; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; 
   end 
 
 // ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0008 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test XNOR gate"); 
      $display("\n~(a | b) = s\n");  
      $monitor("%b | %b = %b", a, b, s); 
  #1  a=0; b=0; 
  #1  a=0; b=1; 
  #1  a=1; b=0;   
  #1  a=1; b=1; 
   
 end 
 
endmodule // testxnorgate 
 