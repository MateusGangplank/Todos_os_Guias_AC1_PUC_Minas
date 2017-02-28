// --------------
// Exemplo0003 - OR
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 02/08/2012
// --------------

// --------------
// -- or gate
// --------------
module orgate(output s, input p, input q);
 assign s = p | q;
endmodule

// -------------
// -- test or gate
// -------------
module testorgate;
//-------------- Dados locais
 reg a, b; //Definir registradores 
 wire s; //Definir conexão (fio)

// ------------- Intância
 orgate OR1(s, a, b);

// ------------- Preparação
 initial begin: start
  a = 0; b = 0;
 end

// ------------- Parte principal
 initial begin: main
  $display("Exemplo0004 - Josemar Alves Caetano - 448662");
  $display("Teste OR gate.");
  $display("\na | b = s\n");
  
 #1 $display("\t%b | %b = %b", a, b, s);
    a = 0; b = 1;
 #1 $display("\t%b | %b = %b", a, b, s);
    a = 1; b = 0;
 #1 $display("\t%b | %b = %b", a, b, s);
    a = 1; b = 1;
 #1 $display("\t%b | %b = %b", a, b, s);
 
 end //main

endmodule //testorgate
