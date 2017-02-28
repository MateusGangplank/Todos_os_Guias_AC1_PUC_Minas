// -------------------------
// Exemplo0008 - XNOR
// Nome: Guilherme Rodrigues Melo de Oliveira
// Matricula: 427409 
// ------------------------- 
// ------------------------- 
// -- xnor gate
// -------------------------
module xnorgate ( output s,
                            input   p, q);
 assign s = ~(p ^ q);
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
      $display("Exemplo0008 - Guilherme Rodrigues Melo de Oliveira - 427409");
      $display("Test XNOR gate");
      $display("\n~(a ^ b) = s\n");
      a=0; b=0;
  #1  $display("%b & %b = %b", a, b, s);
      a=0; b=1; 
  #1  $display("%b & %b = %b", a, b, s); 
      a=1; b=0; 
  #1  $display("%b & %b = %b", a, b, s); 
      a=1; b=1; 
  #1  $display("%b & %b = %b", a, b, s); 
 end 

endmodule // testxnorgate