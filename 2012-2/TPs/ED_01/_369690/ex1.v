// -------------------------
// Ex 1 - NAND
// Nome: Gabriel Benjamim de Carvalho
// Matricula: 396690
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module nandgate ( output s, input  p,input  q);
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
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end// ------------------------- parte principal
   initial begin
         $display("Ex1 - Gabriel Benjamim de Carvalho - 396690");
         $display("Test NAND gate");
         $display("\na & b = s\n");
           a=0; b=0;
  #1   $display("%b nand %b = %b", a, b, s);
           a=0; b=1;
  #1  $display("%b nand %b = %b", a, b, s);
           a=1; b=0;
  #1   $display("%b nand %b = %b", a, b, s);
           a=1; b=1;
  #1   $display("%b nand %b = %b", a, b, s);
  end
endmodule // testnandgate