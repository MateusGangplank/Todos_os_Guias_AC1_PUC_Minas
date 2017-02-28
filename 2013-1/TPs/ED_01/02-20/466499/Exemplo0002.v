// -------------------------
// Exemplo0002 - NOT
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------
// -------------------------
// -- buffer
// -------------------------
module notgate (output s, input p);
  assign s = ~p; // criar vinculo permanente (dependencia)
endmodule // not gate

// -------------------------
// -- test not gate
// -------------------------
module testnotgate;
// ------------------------- dados locais
reg a; // definir registrador
       // (variavel independente)
wire s; // definir conexao (fio)
        // (variavel dependente )

// ------------------------- instancia
notgate NOT1 (s, a);
// ------------------------- preparacao

initial begin:start
  a=0; // valor inicial
end
// ------------------------- parte principal

initial begin:main
               // execucao unitaria
  $display("Exemplo 0002 - DavidsonFrancis - 466499");
  $display("Test NOT gate:");
  $display("\n~a = s\n");
 
  a = 0;
  #1 $display("~%b = %b", a, s);
  a = 1;
  #1 $display("~%b = %b", a, s);
  end
endmodule // testnotgate
