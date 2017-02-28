// -------------------------
// Exemplo0003 - AND
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- AND gate
// -------------------------
module andgate (output s, input p, input q);
  assign s = p & q; // criar vinculo permanente (dependencia)
endmodule // and gate

// -------------------------
// -- test and gate
// -------------------------
module testandgate;
// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)

// ------------------------- instancia
andgate AND1 (s, a,b);
// ------------------------- preparacao

initial begin:start
  a=0;b=0;
end
// ------------------------- parte principal

initial begin:main
               // execucao unitaria
  $display("Exemplo 0003 - DavidsonFrancis - 466499");
  $display("Test AND gate:");
  $display("\na & b = s\n");
 
  a = 0; b = 0;
  #1 $display("%b & %b = %b", a, b, s);
  a = 0; b = 1;
  #1 $display("%b & %b = %b", a, b, s);
  a = 1; b = 0;
  #1 $display("%b & %b = %b", a, b, s);
  a = 1; b = 1;
  #1 $display("%b & %b = %b", a, b, s);
  end
endmodule // testandgate
