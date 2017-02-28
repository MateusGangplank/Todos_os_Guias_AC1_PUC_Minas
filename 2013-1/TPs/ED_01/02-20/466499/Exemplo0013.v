// -------------------------
// Exemplo0013 - AND
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- AND gate
// -------------------------

module andgate (output s, input p, input q, input r);
  wire a,b;
  assign a = p & q;
  assign b = a & r;
  assign s = b;
endmodule

// -------------------------
// -- test and gate
// -------------------------

module testandgate;

// ------------------------- dados locais

reg a,b,c; // definir registrador
wire s; // definir conexao (fio)

// ------------------------- instancia
andgate AND1 (s, a,b,c);
// ------------------------- preparacao

initial begin:start
  a=0;b=0;c=0;
end

// ------------------------- parte principal

initial begin:main
               // execucao unitaria
  $display("Exemplo 0013 - DavidsonFrancis - 466499");
  $display("Test AND gate:"); 
  $display("\n~(a & b)&c = s\n");
  $monitor("~(%b & %b) & %b = %b", a,b,c, s);
 
  #1 a = 0; b = 0; c = 0;
  #1 a = 0; b = 0; c = 1;
  #1 a = 0; b = 1; c = 0;
  #1 a = 0; b = 1; c = 1;
  #1 a = 1; b = 0; c = 0;
  #1 a = 1; b = 0; c = 1;
  #1 a = 1; b = 1; c = 0;
  #1 a = 1; b = 1; c = 1;
  end
endmodule // testandgate
