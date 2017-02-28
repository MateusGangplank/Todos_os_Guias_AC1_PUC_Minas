// -------------------------
// Exercicio04 - NAND
// Nome: Ádamo Ludwig
// Matricula: 473319
// -------------------------
// -------------------------
// -- nand gate
// -------------------------
module nandgate (output s,input  p, input q);
assign s = (~p|~q);
endmodule // nandgate
// -------------------------
// -- test nand gate
// -------------------------
module testnandgate;
// ------------------------- dados locais
   reg    a, b;   // definir registradores
                 // (variavel independente)
   wire   s;   // definir conexao (fio)
                 // (variavel dependente  )
// ------------------------- instancia
   nandgate NAND1 (s, a, b);
// ------------------------- preparacao
   initial begin:start
      a=0; b=0;     // valor inicial //syntax error Syntax in assignment statement 1-value (havia colocado , no lugar do ;)
   end
   // ------------------------- parte principal
   initial begin
         $display("Exercicio04 - Adamo Ludwig - 473319");
         $display("Test nand gate");
$display("\na & b = ~s\n");
           a=0 ; b=0 ;
  #1   $display("%b & %b = %b", a, b, s);
           a=0; b=1;
  #1   $display("%b & %b = %b", a, b, s);
             a=1; b=0;
  #1   $display("%b & %b = %b", a, b, s);
             a=1; b=1;
  #1   $display("%b & %b = %b", a, b, s);
   end
endmodule // testnandgate