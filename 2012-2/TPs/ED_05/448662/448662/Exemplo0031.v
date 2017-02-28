// ---------------
// Exemplo0031 - SOMADOR ALG�BRICO
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 06/09/2012
// ----------------

// ----------------
// Soma Completa
// ----------------
module somaCompleta(output soma, output carryOut, input a, input b, input carryIn);

//Defini��o dos fios
wire s0, s1, s2, s3;

//Defini��o do circuito
xor xor1(s0, a, b);
xor xor2(soma, s0, carryIn);
and and1(s1, b, carryIn);
and and2(s2, a, b);
and and3(s3, a, carryIn);
or or1(carryOut, s1, s2, s3);

endmodule //somaCompleta

// ----------------
// ALU 01
// ----------------
module alu01(output [2:0]saida, input [1:0]a, input [1:0]b, input operacao);

//Defini��o dos fios do circuito
wire s0, s1, carrySC01;

//Defini��o da ALU
xor xor1(s0, operacao, b[0]);
xor xor2(s1, operacao, b[1]);
somaCompleta sc01(saida[0], carrySC01, a[0], s0, operacao);
somaCompleta sc02(saida[1], saida[2], a[1], s1, carrySC01);

endmodule //alu01

// ----------------
// test alu01
// ----------------
module test_alu01;

// ---------------- Defini��o de dados
reg [1:0] x;
reg [1:0] y;
reg carryIn;
wire [2:0]saida;

// ----------------- Int�ncia
 alu01 alu(saida, x, y, carryIn);

// ------------------ Prepara��o
 initial begin: start
  x = 2'b00; y = 2'b01;
  carryIn = 1'b0;
 end //start

// ------------------- Parte principal
 initial begin: main
   $display("Exemplo0031 - Josemar Alves Caetano - 448662.");
   $display("Test ALU's Somador alg�brico:\n");

  #1 $display("Teste da opera��o: Adi��o\n");
     $display("%b + %b = %b", x, y, saida);
     x = 2'b01; y = 2'b10;
  #1 $display("%b + %b = %b", x, y, saida);
     x = 2'b10; y = 2'b11;
  #1 $display("%b + %b = %b", x, y, saida);
     x = 2'b11; y = 2'b00;
  #1 $display("%b + %b = %b", x, y, saida);
     carryIn = 1'b1;
     x = 2'b11; y = 2'b01;

  #1 $display("\nTeste da opera��o: Subtra��o\n");
     $display("%b - %b = %b", x, y, saida);
     x = 2'b10; y = 2'b00;
  #1 $display("%b - %b = %b", x, y, saida);
     x = 2'b01; y = 2'b10;
  #1 $display("%b - %b = %b", x, y, saida);
     x = 2'b00; y = 2'b11;
  #1 $display("%b - %b = %b", x, y, saida);

 end //begin
 
endmodule //test_alu01






