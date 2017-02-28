// -------------------------
// Exemplo0007 - NOR
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- NOR gate
// -------------------------
module norgate (output s, 
                input p, input q);

  assign s = ~(p | q); // criar vinculo permanente (dependencia)
endmodule // nor gate

// -------------------------
// -- test nor gate
// -------------------------

module testnorgate;

// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)

// ------------------------- instancia
norgate NOR1 (s, a,b);
// ------------------------- preparacao

initial begin:start
  a=0;b=0;
end


// ------------------------- parte principal
initial begin:main
               // execucao unitaria
  $display("Exemplo 0007 - DavidsonFrancis - 466499");
  $display("Test NOR gate:");
  $display("\n~(a | b) = s\n");
  $monitor("~(%b | %b) = %b", a,b, s);
 
  #1 a = 0; b = 0;
  #1 a = 0; b = 1;
  #1 a = 1; b = 0;
  #1 a = 1; b = 1;
  end
endmodule // testnorgate
