// ---------------
// Exemplo0011 - BASE
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 03/08/2012
// ----------------

// ----------------
// test number system
// ----------------
module test_base_01;

// ---------------- Definir dados
 reg [2:0]a;
 reg [2:0]b;
 reg [2:0]c;
 reg [2:0]d;
 
// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0011 - Josemar Alves Caetano - 448662");
	$display("Test number system");
	
	 a = 5;
	 b = 10;
	 c = 15;
	 d = 20;
	 
	$display("\nPositive value");
	$display("a = %d = %3b", a, a); //Os algarismos depois do % e antes do tipo são para espaçamento.
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	$display("d = %d = %5b", d, d);
	$display("d = %d = %5o", d, d);
	$display("d = %d = %5h", d, d);
	
 end //main

endmodule //test_base
	
	