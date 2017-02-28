// -------------------------
// Ex6 - XOR
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- XOR gate
// -------------------------
module xorgate ( output s, input  p,input  q);
assign s = (p & ~q) | (~p & q);
endmodule // XORgate
// ---------------------
// -- test XOR gate
// ---------------------
module testxorgate;
// ------------------------- dados locais
   reg   a, b; // definir registradores
   wire  s;    // definir conexao (fio)
// ------------------------- instancia
   xorgate XOR1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end// ------------------------- parte principal
   initial begin
         $display("Ex6 - Gabriel Benjamim de Carvalho - 396690");
         $display("Test XOR gate");
         $display("\na & b = s\n");
           a=0; b=0;
  #1   $display("%b xor %b = %b", a, b, s);
           a=0; b=1;
  #1  $display("%b xor %b = %b", a, b, s);
           a=1; b=0;
  #1   $display("%b xor %b = %b", a, b, s);
           a=1; b=1;
  #1   $display("%b xor %b = %b", a, b, s);
  end
endmodule // testxorgate