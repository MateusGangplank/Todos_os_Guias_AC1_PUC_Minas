// ----------------
// Exemplo0009 - NAND usando De Morgan
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 02/08/2012
// ----------------

// ----------------
// -- nand gate
// ----------------
module nandgate(output s, input p, input q);
 assign s = ~p | ~q;
endmodule

// ----------------
// -- test nandgate
// ----------------
module testnandgate;

// ---------------- Dados locais
 reg a, b; //Definir registradores
 wire s; //Definir conexão (fio)

// ---------------- Intância
 nandgate NAND1(s, a, b);

// ---------------- Preparação
 initial begin:start
  a = 0; b = 0;
 end

// ---------------- Parte principal
 initial begin:main
   $display("Exemplo0009 - Josemar Alves Caetano - 448662");
   $display("Teste NAND gate usando De Morgan.");
   $display("\t~a | ~b)\n");
  
   $monitor("\t~%b | ~%b) = %b", a, b, s);
  #1 a = 0; b = 1;
  #1 a = 1; b = 0;
  #1 a = 1; b = 1;
 
 end//main
 
endmodule//testnandgate