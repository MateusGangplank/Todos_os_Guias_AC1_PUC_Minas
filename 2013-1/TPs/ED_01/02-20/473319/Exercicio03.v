// -------------------------
// Exercicio03 - XNOR
// Nome: Ádamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// -- XNOR gate
// -------------------------
module XNORgate ( output s,
                         input  p, q);
assign s = (~(p ^ q));
endmodule // XNORgate
// ---------------------
// -- test XNOR gate
// ---------------------
module testXNORgate;
// ------------------------- dados locais
   reg   a, b; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   XNORgate XNOR1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end
// ------------------------- parte principal
   initial begin
         $display("Exercicio03 - Adamo Ludwig - 473319");
         $display("Test XNOR gate");
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
endmodule // testXNORgate