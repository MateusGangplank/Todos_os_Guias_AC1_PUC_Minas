 
// ------------------------- 
// Exemplo0007 - NOR 
// Nome: Mateus Augusto Moraes Ferreira
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
// -- nor gate 
// ------------------------- 
module norgate ( output s, 
                            input   p, q); 
 assign s = (~(p | q)); 
endmodule // norgate 
 
// --------------------- 
// -- test nor gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
   reg   a, b; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; 
   end 
 
 // ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0007 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test NOR gate"); 
      $display("\n~(a | b) = s\n");  
      $monitor("%b | %b = %b", a, b, s); 
  #1  a=0; b=0; 
  #1  a=0; b=1; 
  #1  a=1; b=0;   
  #1  a=1; b=1; 
   
 end 
 
endmodule // testnorgate 
 