// -------------------------
// Exemplo0006 - NAND
// Nome: Guilherme Rodrigues Melo de Oliveira
// Matricula: 427409 
// ------------------------- 
// ------------------------- 
// -- nand gate
// ------------------------- 
module nandgate ( output s,
                               input  p,  
                               input  q); 
 assign s = ~(p & q);
endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------
module testnandgate;
// ------------------------- dados locais
   reg   a, b; // definir registradores
   wire  s;    // definir conexao (fio)
// ------------------------- instancia
   nandgate NAND1 (s, a, b);
// ------------------------- preparacao 
   initial begin:start 
      a=0; b=0; 
   end
   // ------------------------- parte principal
 
   initial begin 
      $display("Exemplo0006 - Guilherme Rodrigues Melo de Oliveira - 427409");
      $display("Test NAND gate");
      $display("\n~(a & b) = s\n");
      a=0; b=0;
  #1  $display("%b & %b = %b", a, b, s); 
      a=0; b=1; 
  #1  $display("%b & %b = %b", a, b, s); 
      a=1; b=0; 
  #1  $display("%b & %b = %b", a, b, s); 
      a=1; b=1; 
  #1  $display("%b & %b = %b", a, b, s); 
 end 

endmodule // testnandgate