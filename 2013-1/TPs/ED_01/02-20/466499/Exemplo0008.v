// -------------------------
// Exemplo0008 - XNOR
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- XNOR gate
// -------------------------
module xnorgate (output s, 
                input p, input q);

  assign s = ~(p ^ q); // criar vinculo permanente (dependencia)
endmodule // xnor gate

// -------------------------
// -- test xnor gate
// -------------------------

module testxnorgate;

// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)

// ------------------------- instancia
xnorgate XNOR1 (s, a,b);
// ------------------------- preparacao

initial begin:start
  a=0;b=0;
end


// ------------------------- parte principal
initial begin:main
               // execucao unitaria
  $display("Exemplo 0008 - DavidsonFrancis - 466499");
  $display("Test XNOR gate:");
  $display("\n~(a ^ b) = s\n");
  $monitor("~(%b ^ %b) = %b", a,b, s);
 
  #1 a = 0; b = 0;
  #1 a = 0; b = 1;
  #1 a = 1; b = 0;
  #1 a = 1; b = 1;
  end
endmodule // testxnorgate
