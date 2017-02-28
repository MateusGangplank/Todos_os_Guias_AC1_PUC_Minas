// ----------------
// Exemplo0015 - OR com 4 entradas usando outros m�dulos
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 03/08/2012
// ----------------

// ----------------
// -- or gate 
// ----------------
module orgate(output s, input o, input p);
 assign s = (o | p);
endmodule

// ----------------
// -- test orgate
// ----------------
module testorgate;

// ---------------- Dados locais
 reg a, b, c, d; //Definir registradores
 wire s, t, u; //Definir conex�es (fios)

// ---------------- Inst�ncia 
 orgate OR1(s, a , b); 
 orgate OR2(t, c, d);
 orgate OR3(u, s, t); //Porta da disjun��o final

// ---------------- Prepara��o
 initial begin: start
  a = 0; b = 0; c = 0; d = 0;
 end

// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0015 - Josemar Alves Caetano - 448662");
	$display("Teste OR gate usando outros m�dulos.");
	$display("\t(a | b) = s e (c | d) = t => (s | t) = u\n");
	
	$monitor("\t(%b | %b) = %b e (%b | %b) = %b => (%b | %b) = %b",a, b, s, c, d, t, s, t, u);
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

endmodule //testorgate