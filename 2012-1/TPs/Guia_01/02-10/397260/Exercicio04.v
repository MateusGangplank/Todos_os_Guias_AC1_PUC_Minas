// -------------------------
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 397260
// -------------------------
// -------------------------
// -- Nand gate (Morgan)
// -------------------------
module andgate ( output s, 
                               input  a, 
                               input  b);
assign s = (~a) | (~b);
endmodule // Nandgate
// ---------------------
// -- test Nand gate
// ---------------------
module testNandgate;
// ------------------------- dados locais
   reg   a, b; // definir registradores
wire  s;    // definir conexao (fio)
// ------------------------- instancia
   andgate NAND1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
                   // atribuicao simultanea
// dos valores iniciais
      a=0; b=0;
   end// ------------------------- parte principal
   initial begin
      $display("Exercicio1 - Pedro Henrique Hardeman Guedes - 397260");
      $display("Test NAND gate");
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
endmodule // testandgate