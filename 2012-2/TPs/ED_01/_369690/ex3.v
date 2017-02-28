// -------------------------
// Ex3 - XNOR
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- xnor gate
// -------------------------
module xnorgate ( output s, input  p,input  q);
assign s = ~(p ^ q);
endmodule // xnorgate
// ---------------------
// -- test xnorgate
// ---------------------
module testxnorgate;
// ------------------------- dados locais
   reg   a, b; // definir registradores
   wire  s;    // definir conexao (fio)
// ------------------------- instancia
   xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end// ------------------------- parte principal
   initial begin
         $display("Ex1 - Gabriel Benjamim de Carvalho - 396690");
         $display("Test xnor gate");
         $display("\na & b = s\n");
           a=0; b=0;
  #1   $display("%b xnor %b = %b", a, b, s);
           a=0; b=1;
  #1  $display("%b xnor %b = %b", a, b, s);
           a=1; b=0;
  #1   $display("%b xnor %b = %b", a, b, s);
           a=1; b=1;
  #1   $display("%b xnor %b = %b", a, b, s);
  end
endmodule // testxnorgate