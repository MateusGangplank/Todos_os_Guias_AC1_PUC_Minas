// ----------------
// Exemplo0007 - NOR
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 02/08/2012
// ----------------

// ----------------
// -- nor gate
// ----------------
module norgate(output s, input p, input q);
 assign s = (~(p | q));
endmodule

// ----------------
// -- test nor gate
// ----------------
module testnorgate;

// ---------------- Dados locais
 reg a, b; //Definir registradores 
 wire s; //Definir conex�o (fio)
 
// ---------------- Int�ncia
 norgate NOR1(s, a, b);
 
// ---------------- Prepara��o
 initial begin:start
  a = 0; b = 0;
 end
 
// ---------------- Parte principal
 initial begin:main
   $display("Exemplo0007 - Josemar Alves Caetano - 448662");
   $display("Teste NOR gate.");
   $display("\t~(a | b)\n");
  
   $monitor("\t~(%b | %b) = %b", a, b, s);
  #1 a = 0; b = 1;
  #1 a = 1; b = 0;
  #1 a = 1; b = 1;
 
 end//main

endmodule //testnorgate