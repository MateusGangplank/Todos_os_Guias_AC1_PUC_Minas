// ---------------
// Extra02- Cálculo do complemento de 2 de um byte
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 04/08/2012
// ----------------

// ----------------
// complemento de 2
// -----------------
module complemento_2(output [3:0]s, input [3:0]p);
 assign s = ~p + 1'b1;
endmodule

// ----------------
// test complemento_2
// -----------------
module test_complemento_2;

// ----------------- Definir dados
 reg [3:0] a;
 wire [3:0]s;

// ----------------- Intância
 complemento_2 C2(s, a);
 
// ----------------- Parte principal
 initial begin: start
   a = 4'b1010;
 end
 
// ----------------- Parte principal
 initial begin: main
   $display("Extra02 - Josemar Alves Caetano - 448662");
	$display("Teste de complemento de 2.\n");
	
	$monitor("\t%b em complemento de 2 é: %b",a, s);
  #1 a = 4'b0001;
  
 end //main
 
endmodule //test_complemento_2
    