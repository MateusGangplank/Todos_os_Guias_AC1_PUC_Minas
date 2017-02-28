// ---------------
// Extra01- Cálculo do complemento de 1 de um byte
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 04/08/2012
// ----------------

// ----------------
// complemento de 1
// -----------------
module complemento_1(output [3:0]s, input [3:0]p);
 assign s = ~p;
endmodule

// ----------------
// test complemento_1
// -----------------
module test_complemento_1;

// ----------------- Definir dados
 reg [3:0] a;
 wire [3:0]s;

// ----------------- Intância
 complemento_1 C1(s, a);
 
// ----------------- Parte principal
 initial begin: start
   a = 4'b1010;
 end
 
// ----------------- Parte principal
 initial begin: main
   $display("Extra01 - Josemar Alves Caetano - 448662");
	$display("Teste de complemento de 1.\n");
	
	$monitor("\t%b em complemento de 1 é: %b",a, s);
  #1 a = 4'b0001;
  
 end //main
 
endmodule //test_complemento_1
    