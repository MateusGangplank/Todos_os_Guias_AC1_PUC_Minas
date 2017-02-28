// ---------------
// Exemplo0032 - SOMADOR ALG�BRICO COM ZERO FLAG
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
// Zero Flag
// ----------------
module zeroFlag(output zero, input [2:0]a);

//Defini��o dos fios do subcircuito
wire s0;

// Defini��o da ALU
or or1(s0, a[2], a[1], a[0]);
not not1(zero, s0);

endmodule //zeroFlag

// ----------------
// ALU 02
// ----------------

module alu02(output [3:0]saida, input [1:0]a, input [1:0]b, input carryIn);

//Realiza a opera��o de soma ou subtra��o
alu01 a1(saida[2:0], a, b, carryIn);

//Verifica se h� o flag ZERO
zeroFlag zf(saida[3], saida[2:0]);

endmodule //alu02


// ----------------
// test alu02
// ----------------
module test_alu02;

// ---------------- Defini��o de dados
reg [1:0] x;
reg [1:0] y;
reg carryIn;
wire [3:0]s;

// ----------------- Int�ncia
 alu02 alu(s, x, y, carryIn);

// ------------------ Prepara��o
 initial begin: start
  x = 2'b00; y = 2'b00;
  carryIn = 1'b0;
 end //start

// ------------------- Parte principal
 initial begin: main
   $display("Exemplo0032 - Josemar Alves Caetano - 448662.");
   $display("Test ALU's Somador alg�brico:\n");

  #1 $display("Teste da opera��o: Adi��o\n");
     $display("Flags:\t\tZero");
     $display("%b + %b = %b \t%b", x, y, s[2:0], s[3]);
     x = 2'b01; y = 2'b10;
  #1 $display("%b + %b = %b \t%b", x, y, s[2:0], s[3]);
     x = 2'b10; y = 2'b11;
  #1 $display("%b + %b = %b \t%b", x, y, s[2:0], s[3]);
     x = 2'b11; y = 2'b00;
  #1 $display("%b + %b = %b \t%b", x, y, s[2:0], s[3]);
     carryIn = 1'b1;
     x = 2'b11; y = 2'b01;

  #1 $display("\nTeste da opera��o: Subtra��o\n");
     $display("Flags:\t\tZero");
     $display("%b - %b = %b \t%b", x, y, s[2:0], s[3]);
     x = 2'b10; y = 2'b00;
  #1 $display("%b - %b = %b \t%b", x, y, s[2:0], s[3]);
     x = 2'b01; y = 2'b10;
  #1 $display("%b - %b = %b \t%b", x, y, s[2:0], s[3]);
     x = 2'b11; y = 2'b11;
  #1 $display("%b - %b = %b \t%b", x, y, s[2:0], s[3]);

 end //begin
 
endmodule //test_alu02