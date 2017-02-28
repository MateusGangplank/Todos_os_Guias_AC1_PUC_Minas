// ---------------
// Exemplo0031 - F4
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 20/08/2012
// ----------------

// ----------------
// fand1
// ----------------
module fand1(output s, input a, input b);

and(s, a, b);

endmodule

// ----------------
// for1
// ----------------
module for1(output s, input a, input b);

or(s, a, b);

endmodule


// ----------------
// f4
// ----------------
module f4(output [3:0]s0, output [3:0]s1, input [3:0]a, input [3:0]b);

//Chama a LU bit a bit simultâneamente

 fand1 and1(s0[0], a[0], b[0]); 
 fand1 and2(s0[1], a[1], b[1]); 
 fand1 and3(s0[2], a[2], b[2]); 
 fand1 and4(s0[3], a[3], b[3]); 
 
 for1 or1(s1[0], a[0], b[0]); 
 for1 or2(s1[1], a[1], b[1]); 
 for1 or3(s1[2], a[2], b[2]); 
 for1 or4(s1[3], a[3], b[3]); 

endmodule //f4
 

// ----------------
// test f4
// ----------------
module test_f4;

// ---------------- Definir dados
 reg [3:0]x; //Primeiro byte
 reg [3:0]y; //Segundo byte
 wire[3:0]z0; //Primeira saída 
 wire[3:0]z1; //Segunda saída
 
 
// ----------------- Intância
f4 modulo1(z0, z1, x, y);

// ----------------- Preparação
 initial begin: start
   x = 4'b0011; y = 4'b0101;
 end

// ----------------- Parte principal
 initial begin:main
   $display("Exemplo0031 - Josemar Alves Caetano - 448662");
	$display("Test LU's module");
	
  // Projetar testes do modulo
	
	$display("\nTeste da operação AND:\n");

	 #1 $display("%3b & %3b = %3b", x, y, z0); //Resultado esperado: 0001
	    x = 4'b0001; y = 4'b0100;

    #1 $display("%3b & %3b = %3b", x, y, z0); //Resultado esperado: 0000
	    x = 4'b0101; y = 4'b0100;

	 #1 $display("%3b & %3b = %3b", x, y, z0); //Resultado esperado: 0100
       x = 4'b0001; y = 4'b0100; 
	$display("\nTeste da operação OR:\n");
   
	#1  $display("%3b | %3b = %3b", x, y, z1);  //Resultado esperado: 0101
       x = 4'b0011; y = 4'b0100; 
  
   #1  $display("%3b | %3b = %3b", x, y, z1);  //Resultado esperado: 0111

 end
 
endmodule //test_f4
 