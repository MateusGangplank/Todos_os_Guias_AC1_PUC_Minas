// ---------------
// Exemplo0020 - BASE
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 04/08/2012
// ----------------

// ----------------
// test operacoes e complementos 
// ----------------
module test_operacoes_complementos;

// ---------------- Definir dados
 reg [7:0]a;
 reg [7:0]b; reg [7:0]nb; 
 reg [7:0]c;
  
// ---------------- Parte principal
 initial begin: main
   $display("Exemplo0020 - Josemar Alves Caetano - 448662");
	$display("Teste de complementos de 2.");
	
	 a = 6'b101010;
	 b = 4'b1001;
	 
	    
	$display("a.)");
	$display("%b(2) , Em complemento de 2 => %b", b, nb);
	$display("%b(2) - %b(2) = %b", a, b, c);
	 
	 a = 5'b11011;
	 b = 6'o15;
	 nb = ~b + 1'b1;
	 c = a + nb;
	 
   
	$display("b.)");
	$display("%o(8) , Em complemento de 2 => %b", b, nb);
	$display("%b(2) - %o(8) = %b", a, b, c);

	 a = 5'o34;
	 b = 4'hc;
	 nb = ~b + 1'b1;
	 c = a + nb;
   
	$display("c.)");
	$display("%h(16) , Em complemento de 2 => %b", b, nb);
	$display("%o(8) - %h(16) = %b", a, b, c);
	
	 a = 8'hda;
	 b = 8'b10111001;
	 nb = ~b + 1'b1;
	 c = a + nb;
   
	$display("d.)");
	$display("%b(2) , Em complemento de 2 => %b", b, nb);
   $display("%h(16) - %b(2) = %b", a, b, c);
	
	 a = 5'd27;
	 b = 8'h1b;
	 nb = ~b + 1'b1;
	 c = a + nb;
   
	$display("e.)");
	$display("%h(16) , Em complemento de 2 => %b", b, nb);
   $display("%d(10) - %h(16) = %b", a, b, c);


 end //main

endmodule //test__operacoes_complementos