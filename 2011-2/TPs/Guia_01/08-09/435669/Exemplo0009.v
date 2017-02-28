 
// ------------------------- 
// Exemplo0008 - AND 
// Nome: Mateus Augusto Moraes Ferreira
// Matricula: 435669 
// ------------------------- 
 
// ------------------------- 
// -- and gate 
// ------------------------- 
module andgate ( output s, 
                            input   p,q,r); 
 assign s = ~((~p)|(~q)|(~r)); 
endmodule // andgate 
 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
   reg   a,b,c; // definir registradores 
   wire  s;    // definir conexao (fio) 
// ------------------------- instancia 
   andgate AND1 (s, a, b, c); 
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; c=0; 
   end 
 
 // ------------------------- parte principal 
 
   initial begin 
      $display("Exemplo0009 - Mateus Augusto Moraes Ferreira - 435669"); 
      $display("Test AND gate - 3 entradas"); 
      $display("\n (a & b & c) = s\n");  
      $monitor("%b & %b & %b = %b", a, b,c, s); 
  #1  a=0; b=0; c=0;
  #1  a=0; b=0; c=1;
  #1  a=0; b=1; c=0;
  #1  a=0; b=1; c=1;
  #1  a=1; b=0; c=0;
  #1  a=1; b=0; c=1;
  #1  a=1; b=1; c=0;
  #1  a=1; b=1; c=1;
  
 end 
 
endmodule // testandgate 
 