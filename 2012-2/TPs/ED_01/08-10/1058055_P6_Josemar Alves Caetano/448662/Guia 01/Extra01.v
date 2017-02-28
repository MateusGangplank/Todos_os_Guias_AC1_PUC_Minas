// ----------------
// Extra01 - Módulo que retorna 1 quando todos as entradas forem iguais a 0. 
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 03/08/2012
// ----------------

// ----------------
// -- nor gate
// ----------------
module norgate(output u, input a, input b, input c, input d, input e, input f, input g, input h);
 assign u = ~(a | b | c | d | e | f | g | h);
endmodule

// ----------------
// -- test norgate
// ----------------
module testnorgate;

// ---------------- Dados locais
 reg a, b, c, d, e, f, g, h; //Definir registradores
 wire s; //Definir conexões (fios)

// ----------------- Intância
 norgate NOR1(u, a, b, c, d, e, f, g, h);

// ----------------- Preparação
 initial begin: start
   a = 0; b = 0; c = 0; d = 0; e = 0; f = 0; g = 0; h = 0;
 end

// ----------------- Parte principal
 initial begin: main
   $display("Extra01 - Josemar Alves Caetano - 448662");
	$display("Circuito que retorna 1 quando todas as entradas são iguais a 0.");
	$display("\t~(a | b | c | d | e | f | g | h ) = s\n");
	
	$monitor("\t~(%b | %b | %b | %b | %b | %b | %b | %b ) = %b", a, b, c, d, e, f, g, h, u);

 end //main

endmodule //testnorgate
