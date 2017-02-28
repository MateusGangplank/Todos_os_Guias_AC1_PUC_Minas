// ----------------
// Exemplo0011 - XOR usando De Morgan
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 03/08/2012
// ----------------

// ----------------
// -- xor gate
// ----------------
module xorgate(output s, input p, input q);
 assign s = ((~p & q) + (p & ~q));
endmodule

// ----------------
// -- test xorgate
// ----------------
module testxorgate;

// ---------------- Dados locais
 reg a, b; //Definir registradores
 wire s; //Definir conexão (fio)

// ---------------- Intância
 xorgate XOR1(s, a, b);

// ---------------- Preparação
 initial begin: start
  a = 0; b = 0;
 end

// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0011 - Josemar Alves Caetano - 448662");
	$display("Teste XOR gate usando De Morgan.");
	$display("\t(~a & b) + (a & ~b) = s\n");
	
	$monitor("\t%b XOR %b = %b", a, b, s);
  #1 a = 0; b = 1;
  #1 a = 1; b = 0;
  #1 a = 1; b = 1;
 
 end //main

endmodule //testxorgate