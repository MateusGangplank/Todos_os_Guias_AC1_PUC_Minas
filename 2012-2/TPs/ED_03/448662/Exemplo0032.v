// ---------------
// Exemplo0032 - F4 - LU 02
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 20/08/2012
// ----------------

// ----------------
// LU 02
// ----------------
module lu02(output saida, input a, input b, input chave);

//Declaração dos fios da LU
 wire s0, s1, c0, c1, d0, d1;

//Declaração das portas da LU
 and and1(s0, a, b); //Primeira operação da LU
 or or1(s1, a, b); //Segunda operação da LU
 
//Descrição da LU
 not not1(c1, chave);
 buf buf1(c0, chave);
 and and2(d0, s0, c0); //Coorderna a AND1
 and and3(d1, s1, c1); //Coordena a OR1
 or or2(saida, d0, d1);

endmodule //lu02

// ----------------
// f4 
// ----------------
module f4(output [3:0]s, input [3:0]a, input [3:0]b, input chave);
 
//Chama a LU bit a bit de acordo com a chave
 lu02 lu1(s[0], a[0], b[0], chave);
 lu02 lu2(s[1], a[1], b[1], chave);
 lu02 lu3(s[2], a[2], b[2], chave);
 lu02 lu4(s[3], a[3], b[3], chave);
 
endmodule //f4
 

// ----------------
// test f4
// ----------------
module test_f4;

// ---------------- Definir dados
 reg [3:0]x; //Primeiro byte
 reg [3:0]y; //Segundo byte
 wire[3:0]z; //Saída
 reg chave;
 
// ----------------- Intância
f4 modulo(z, x, y, chave);

// ----------------- Preparação
 initial begin: start
   x = 4'b0011; y = 4'b0101;
   chave = 1'b1;
 end

// ----------------- Parte principal
 initial begin:main
   $display("Exemplo0032 - Josemar Alves Caetano - 448662");
	$display("Test LU's module");
	
   // Projetar testes do modulo
	
	$display("\nTeste da operação AND:\n");

	 #1 $display("%3b & %3b = %3b", x, y, z); //Resultado esperado: 0001
	    x = 4'b0001; y = 4'b0100;

    #1 $display("%3b & %3b = %3b", x, y, z); //Resultado esperado: 0000
	    x = 4'b0101; y = 4'b0100;

	 #1 $display("%3b & %3b = %3b", x, y, z); //Resultado esperado: 0100
       x = 4'b0001; y = 4'b0100; 
	$display("\nTeste da operação OR:\n");
   
	#1  chave = 1'b0;
	
	#1  $display("%3b | %3b = %3b", x, y, z);  //Resultado esperado: 0101
       x = 4'b0011; y = 4'b0100; 
  
   #1  $display("%3b | %3b = %3b", x, y, z);  //Resultado esperado: 0111




 end
 
endmodule //test_f4
 