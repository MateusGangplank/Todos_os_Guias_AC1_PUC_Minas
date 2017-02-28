// ----------------
// Exemplo0013 - AND usando De Morgan com 4 entradas
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 03/08/2012
// ----------------

// ----------------
// -- and gate
// ----------------
module andgate(output t, input p, input q, input r, input s);
 assign t = p & q & r & s ;
endmodule

// ----------------
// -- test andgate
// ----------------
module testandgate;

// ---------------- Dados locais
 reg a, b, c, d; //Definir registradores
 wire t; //Definir conexão (fio)

// ---------------- Intância
 andgate AND1(t, a, b, c, d);

// ---------------- Preparação
 initial begin: start
  a = 0; b = 0; c = 0; d = 0;
 end

// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0013 - Josemar Alves Caetano - 448662");
	$display("Teste AND gate usando De Morgan com 4 entradas.");
	$display("\ta & b & c & d = s\n");
	
	$monitor("\t%b & %b & %b & %b = %b", a, b, c, d, t);
  #1 a = 0; b = 0; c = 0; d = 1;
  #1 a = 0; b = 0; c = 1; d = 0;
  #1 a = 0; b = 0; c = 1; d = 1;
  #1 a = 0; b = 1; c = 0; d = 0;
  #1 a = 0; b = 1; c = 0; d = 1;
  #1 a = 0; b = 1; c = 1; d = 0;
  #1 a = 0; b = 1; c = 1; d = 1;
  #1 a = 1; b = 0; c = 0; d = 0;
  #1 a = 1; b = 0; c = 0; d = 1;
  #1 a = 1; b = 0; c = 1; d = 0;
  #1 a = 1; b = 0; c = 1; d = 1;
  #1 a = 1; b = 1; c = 0; d = 0;
  #1 a = 1; b = 1; c = 0; d = 1;
  #1 a = 1; b = 1; c = 1; d = 0;
  #1 a = 1; b = 1; c = 1; d = 1;
 
 end //main

endmodule //testandgate