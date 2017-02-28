// -------------------------
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 397260
// -------------------------
// -------------------------
// -- xnor gate
// -------------------------
module orgate ( output s,
                            input  a, b);
assign s = (~a)&(~b) | (a & b);
endmodule // xnorgate
// ---------------------
// -- test xnor gate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
   reg   a, b; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   orgate NOR1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end// ------------------------- parte principal
   initial begin
      $display("Exercicio2 - Pedro Henrique Hardeman Guedes - 397260");
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