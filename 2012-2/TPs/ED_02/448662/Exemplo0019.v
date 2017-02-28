// ---------------
// Exemplo0019 - BASE
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 04/08/2012
// ----------------

// ----------------
// test complementos 
// ----------------
module test_complementos_02;

// ---------------- Definir dados
 reg [4:0]a;
 reg [5:0]b;
 reg [6:0]c;
 reg [7:0]d;
  
 
// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0019 - Josemar Alves Caetano - 448662");
	$display("Teste de complementos de 2.");
	
	 d = 8'b101011;
   
	$display("a.)");
	$display("%b(2) , Em complemento de 2 => %b", d, ~d + 1'b1);
	
	 c = 7'b111001;
   
	$display("b.)");
	$display("%b(8) , Em complemento de 2 => %b", c, ~c + 1'b1);
	
	 b = 6'd27;
   
	$display("c.)");
	$display("%b(10) , Em complemento de 2 => %b", b, ~b + 1'b1);
	
	 a = 5'hc;
   
	$display("d.)");
	$display("%b(16) , Em complemento de 2 => %b", a, ~a + 1'b1);
	
	 d = 8'o21;
   
	$display("e.)");
	$display("%b(10) , Em complemento de 2 => %b", d, ~d + 1'b1);
	
 end //main

endmodule //test_complementos_01