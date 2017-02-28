// -------------------------
// Ex2 - NOR
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- nor gate
// -------------------------
module norgate ( output s, input  p,input  q);
assign s = ~(p | q);
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
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end// ------------------------- parte principal
   initial begin
         $display("Ex1 - Gabriel Benjamim de Carvalho - 396690");
         $display("Test NOR gate");
         $display("\na & b = s\n");
           a=0; b=0;
  #1   $display("%b nor %b = %b", a, b, s);
           a=0; b=1;
  #1  $display("%b nor %b = %b", a, b, s);
           a=1; b=0;
  #1   $display("%b nor %b = %b", a, b, s);
           a=1; b=1;
  #1   $display("%b nor %b = %b", a, b, s);
  end
endmodule // testnorgate