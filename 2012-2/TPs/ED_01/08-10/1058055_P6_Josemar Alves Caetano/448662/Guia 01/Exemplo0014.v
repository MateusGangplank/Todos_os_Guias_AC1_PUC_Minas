// ----------------
// Exemplo0014 - AND com 4 entradas usando outros módulos
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 03/08/2012
// ----------------

// ----------------
// -- and gate 
// ----------------
module andgate(output s, input o, input p);
 assign s = (o & p);
endmodule

// ----------------
// -- test andgate
// ----------------
module testandgate;

// ---------------- Dados locais
 reg a, b, c, d; //Definir registradores
 wire s, t, u; //Definir conexões (fios)

// ---------------- Instância 
 andgate AND1(s, a , b);  
 andgate AND2(t, c, d);
 andgate AND3(u, s, t); //Porta da conjunção final

// ---------------- Preparação
 initial begin: start
  a = 0; b = 0; c = 0; d = 0;
 end

// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0014 - Josemar Alves Caetano - 448662");
	$display("Teste AND gate usando outros módulos.");
	$display("\t(a & b) = s e (c & d) = t => (s & t) = u\n");
	
	$monitor("\t(%b & %b) = %b e (%b & %b) = %b => (%b & %b) = %b",a, b, s, c, d, t, s, t, u);
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