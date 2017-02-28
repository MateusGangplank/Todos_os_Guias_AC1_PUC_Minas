// ---------------
// Exemplo0013 - BASE
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 04/08/2012
// ----------------

// ----------------
// test number system
// ----------------
module test_base_03;

// ---------------- Definir dados
 reg [2:0] a;
 reg [2:0] b;
 reg [2:0] c;
 reg [2:0] d;
 
// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0013 - Josemar Alves Caetano - 448662");
	$display("Test number system");
	
	 a = 5;
	 b = 10;
	 c = 15;
	 d = 20;
	 
	$display("\nPositive value");
	$display("a = %d = %3b", a, a); //Os algarismos depois do % e antes do tipo s�o para espa�amento.
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	$display("d = %d = %5b", d, d);
	$display("d = %d = %5o", d, d);
	$display("d = %d = %5h", d, d);
	
	 a = -5;
	 b = -5;
	 c = -5;
	 
	$display("\nNegative value");
	$display("a = -5[3] = %d = %3b", a, a); 
	$display("b = -5[4] = %d = %4b", b, b); 
	$display("c = -5[5] = %d = %5b", c, c); 
	
	 a = ~5 + 1;
	 b = ~5 + 1;
	 c = ~5 + 1;
	
	$display("\nNegative mixed expresion");
	$display("a = %d = %3b", a, a);
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	
 end //main
 
endmodule //test_base_03
	
