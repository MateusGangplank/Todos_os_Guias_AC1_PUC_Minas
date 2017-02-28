// -------------------------
// Exercicio02 - NOR
// Nome: Ádamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// -- NNOR gate
// -------------------------
module NORgate ( output s,
                         input  p, q);
assign s = (~(p | q));
endmodule // NORgate
// ---------------------
// -- test NOR gate
// ---------------------
module testNORgate;
// ------------------------- dados locais
   reg   a, b; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   NORgate NOR1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end
// ------------------------- parte principal
   initial begin
         $display("Exercicio02 - Adamo Ludwig - 473319");
         $display("Test NOR gate");
$display("\na & b = s\n");
           a=0; b=0;
  #1   $display("%b & %b = %b", a, b, s);
           a=0; b=1;
  #1   $display("%b & %b = %b", a, b, s);
           a=1; b=0;
  #1   $display("%b & %b = %b", a, b, s);
           a=1; b=1;
  #1   $display("%b & %b = %b", a, b, s);
end
endmodule // testNORgate