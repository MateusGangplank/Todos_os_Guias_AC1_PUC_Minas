// ----------------
// Extra02 - Módulo que retorna 1 quando alguma das entradas for igual a 1. 
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 03/08/2012
// ----------------

// ----------------
// -- or gate 
// ----------------
module orgate(output s, input a, input b, input c, input d, input e, input f, input g, input h);
 assign s = a | b | c | d | e | f | g | h;
endmodule

// ----------------
// -- test orgate
// ----------------
module testorgate;

// ---------------- Dados locais
 reg a, b, c ,d, e, f, g, h; //Definir registradores
 wire s; //Definir conexão (fio)

// ---------------- Intância
 orgate OR1(s, a, b, c, d, e, f, g, h);
 
// ---------------- Preparação
 initial begin: start
   a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 1;
 end

// ---------------- Parte principal
 initial begin:main
   $display("Extra02 - Josemar Alves Caetano - 448662");
	$display("Teste de circuito que retorna 1 quando alguma entrada é igual a 1.");
	$display("\t( a | b | c | d | e | f | g | h )= s\n");
	
	$monitor("\t( %b | %b | %b | %b | %b | %b | %b | %b ) = %b", a, b, c, d, e, f, g, h, s);
   
 end //main

endmodule //testorgate
 
 