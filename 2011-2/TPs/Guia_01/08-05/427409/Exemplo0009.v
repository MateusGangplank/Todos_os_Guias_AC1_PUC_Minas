// -------------------------
// Exemplo0009 - AND3
// Nome: Guilherme Rodrigues Melo de Oliveira
// Matricula: 427409 
// ------------------------- 
// ------------------------- 
// -- and gate
// -------------------------
module andgate ( output s,
                            input   p, q, u);
 assign s = ~~(p | q | u);
endmodule // andgate

// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
   reg   a, b, c; // definir registradores
   wire  s;    // definir conexao (fio)
// ------------------------- instancia
   andgate AND3 (s, a, b, c);
// ------------------------- preparacao
   initial begin:start
      a=0; b=0; c=0;
   end


// ------------------------- parte principal

   initial begin
      $display("Exemplo0009 - Guilherme Rodrigues Melo de Oliveira - 427409");
      $display("Test AND3 gate");
      $display("\n(a & b & c) = s\n");
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
      a=1;b=1;c=0;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
      a=1;b=1;c=1;
  #1  $display("%b & %b & %b = %b", a, b, c, s);
 end 

endmodule // testandgate