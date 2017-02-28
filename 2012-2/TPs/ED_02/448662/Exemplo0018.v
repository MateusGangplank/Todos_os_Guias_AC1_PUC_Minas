// ---------------
// Exemplo0018 - BASE
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 04/08/2012
// ----------------

// ----------------
// test complementos 
// ----------------
module test_complementos_01;

// ---------------- Definir dados
 reg [5:0]a; 
 reg [4:0]b;
 reg [7:0]c;
 reg [4:0]d;
 
// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0018 - Josemar Alves Caetano - 448662");
	$display("Teste de complementos de 2.");
	
	 a = 6'b100110;
   
	$display("a.)");
	$display("%b(2) , Em complemento de 2 => %b", a, ~a + 1'b1);
	
	 a = 6'o24;
   
	$display("b.)");
	$display("%b(8) , Em complemento de 2 => %b", a, ~a + 1'b1);
	
	 b = 5'd25;
   
	$display("c.)");
	$display("%b(10) , Em complemento de 2 => %b", b, ~b + 1'b1);
	
	 c = 8'h2d;
   
	$display("d.)");
	$display("%b(16) , Em complemento de 2 => %b", c, ~c + 1'b1);
	
	 b = 5'd27;
	 a = 6'd37;
	 d = b - a;
   
	$display("e.)");
	$display("%b(10) - %b(10) = %b , Em complemento de 2 => %b", b, a, d, ~d + 1'b1);
	
 end //main

endmodule //test_complementos_01