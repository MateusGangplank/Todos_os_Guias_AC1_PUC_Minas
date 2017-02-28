// -------------------------
// Exemplo0009 - NAND com Morgan
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- NAND gate
// -------------------------
module nandgate (output s, input p, input q);
  assign s = ~p | ~q; // criar vinculo permanente (dependencia)
endmodule // nand gate

// -------------------------
// -- test nand gate
// -------------------------

module testnandgate;

// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)

// ------------------------- instancia
nandgate NAND1 (s, a,b);
// ------------------------- preparacao

initial begin:start
  a=0;b=0;
end
// ------------------------- parte principal

initial begin:main
               // execucao unitaria
  $display("Exemplo 0009 - DavidsonFrancis - 466499");
  $display("Test NAND gate:");
  $display("\n~(a & b) = s\n");
 
  a = 0; b = 0;
  #1 $display("~(%b & %b) = %b", a, b, s);
  a = 0; b = 1;
  #1 $display("~(%b & %b) = %b", a, b, s);
  a = 1; b = 0;
  #1 $display("~(%b & %b) = %b", a, b, s);
  a = 1; b = 1;
  #1 $display("~(%b & %b) = %b", a, b, s);
  end
endmodule // testnandgate
