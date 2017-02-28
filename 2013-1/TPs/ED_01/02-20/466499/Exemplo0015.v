// -------------------------
// Exemplo0015 - OR
// Nome: Davidson Francis
// Matricula: 466499
// -------------------------

// -------------------------
// -- OR gate
// -------------------------

module orgate (output s, input p, input q);
  assign s = p | q;
endmodule

module orgate3 (output s, input p, input q, input r);
 wire temp;
 orgate OR1 (temp, p,q);
 assign s = temp | r;
endmodule

// -------------------------
// -- test or gate
// -------------------------

module testorgate;

// ------------------------- dados locais

reg a,b,c; // definir registrador
wire s; // definir conexao (fio)

// ------------------------- instancia
orgate3 OR2 (s, a,b,c);
// ------------------------- preparacao

initial begin:start
  a=0;b=0;c=0;
end

// ------------------------- parte principal

initial begin:main
               // execucao unitaria
  $display("Exemplo 0015 - DavidsonFrancis - 466499");
  $display("Test OR gate:"); 
  $display("\n(a | b)|c = s\n");
  $monitor("(%b | %b) | %b = %b", a,b,c, s);
 
  #1 a = 0; b = 0; c = 0;
  #1 a = 0; b = 0; c = 1;
  #1 a = 0; b = 1; c = 0;
  #1 a = 0; b = 1; c = 1;
  #1 a = 1; b = 0; c = 0;
  #1 a = 1; b = 0; c = 1;
  #1 a = 1; b = 1; c = 0;
  #1 a = 1; b = 1; c = 1;
  end
endmodule // testorgate
