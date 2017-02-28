// -------------------------
// Exemplo0004 - OR
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- OR gate
// -------------------------
module orgate (output s, 
                input p, input q);

  assign s = p | q; // criar vinculo permanente (dependencia)
endmodule // or gate

// -------------------------
// -- test or gate
// -------------------------

module testorgate;

// ------------------------- dados locais
reg a,b; // definir registrador
wire s; // definir conexao (fio)

// ------------------------- instancia
orgate OR1 (s, a,b);
// ------------------------- preparacao

initial begin:start
  a=0;b=0;
end


// ------------------------- parte principal
initial begin:main
               // execucao unitaria
  $display("Exemplo 0004 - DavidsonFrancis - 466499");
  $display("Test OR gate:");
  $display("\na & b = s\n");
 
  a = 0; b = 0;
  #1 $display("%b | %b = %b", a, b, s);
  a = 0; b = 1;
  #1 $display("%b | %b = %b", a, b, s);
  a = 1; b = 0;
  #1 $display("%b | %b = %b", a, b, s);
  a = 1; b = 1;
  #1 $display("%b | %b = %b", a, b, s);
  end
endmodule // testorgate
