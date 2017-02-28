// ---------------
// Exemplo0037 - SOMADOR ALG�BRICO COM FLAGS: OVERFLOW, CARRY, ZERO e SINAL
// Nome: Josemar Alves Caetano
// Matr�cula: 448662
// Data: 08/09/2012
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
// Carry e overflow
// ----------------
module carryOverflow(output carry, output overflow, input [1:0]a, input [1:0]b, input carryIn);

//Defini��o dos fios do circuito
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9,
     ci_n, b1_n, a0_n;

//Defini��o do subcircuito carry
and and1(s0, a[0], b[1], b[0]);
and and2(s1, a[1], a[0], b[0]);
and and3(s2, a[1], b[1]);
or or1(s3, s0, s1, s2);
not not1(ci_n, carryIn);
and and4(carry, ci_n, s3);

//Defini��o do subcircuito overflow
not not2(b1_n, b[1]);
and and5(s4, a[0], b1_n, b[0]);
not not3(a0_n, a[0]);
and and6(s5, a[1], a0_n);
xor xor1(s6, b[1], b[0]);
and and7(s7, a[1], a[0], b[1]);
and and8(s8, s5, s6);
or or2(s9, s4, s8, s7);
and and9(overflow, carryIn, s9);

endmodule //carryOverflow

// ----------------
// Sinal
// ----------------
module sinal(output sinal, input [1:0]a, input [1:0]b, input carryIn);

//Defini��o dos fios do subcircuito
wire a1_n, a0_n, s0, s1, s2, s3;

//Defini��o das portas
not not1(a1_n, a[1]);
not not2(a0_n, a[0]);
and and1(s0, a1_n, b[1]);
and and2(s1, a1_n, a0_n, b[0]);
and and3(s2, a0_n, b[1], b[0]);
or or1(s3, s0, s1, s2);
and and4(sinal, carryIn, s3);

endmodule //sinal

// ----------------
// ALU 05
// ----------------
module alu05(output [6:0]saida, input [1:0]a, input [1:0]b, input carryIn);

//Realiza a opera��o de soma ou subtra��o
alu01 a1(saida[2:0], a, b, carryIn);

//Verifica se h� o flag ZERO
zeroFlag zf(saida[4], saida[2:0]);

//Verifica se h� os flags: CARRY e OVERFLOW
carryOverflow caov(saida[5], saida[6], a, b, carryIn);

//Verifica qual � o sinal
sinal s(saida[3], a, b, carryIn);

endmodule //alu05

// ----------------
// Test alu05
// ----------------
module test_alu05;

// ---------------- Defini��o de dados
reg [1:0] x;
reg [1:0] y;
reg carryIn;
wire [6:0] s;

// ---------------- Inst�ncia
alu05 a5(s, x, y, carryIn);

// ----------------- Prepara��o
  initial begin: start
   x = 2'b00; y = 2'b00;
   carryIn = 1'b0;
  end

// ------------------ Parte principal
  initial begin: main
     $display("Exemplo0037 - Josemar Alves Caetano - 448662.");
     $display("Test ALU's Somador alg�brico com flags: OVERFLOW, CARRY, ZERO e SINAL :\n");

  #1 $display("Teste da opera��o:\n");
     $display("Flags:\t\tOveflow\tCarry\tZero\tSinal");
     $display("%b + %b = %b.\t%b\t\t%b\t\t%b\t\t", x, y, s[2:0], s[6], s[5], s[4], s[3]);
     x = 2'b01; y = 2'b10;
  #1 $display("%b + %b = %b.\t%b\t\t%b\t\t%b\t\t", x, y, s[2:0], s[6], s[5], s[4], s[3]);
     x = 2'b10; y = 2'b11;
  #1 $display("%b + %b = %b.\t%b\t\t%b\t\t%b\t\t", x, y, s[2:0], s[6], s[5], s[4], s[3]);
     x = 2'b11; y = 2'b00;
  #1 $display("%b + %b = %b.\t%b\t\t%b\t\t%b\t\t", x, y, s[2:0], s[6], s[5], s[4], s[3]);
     carryIn = 1'b1;
     x = 2'b11; y = 2'b01;

  #1 $display("\nTeste da opera��o: Subtra��o\n");
     $display("Flags:\t\tOveflow\tCarry\tZero");
     $display("%b - %b = %b.\t%b\t\t%b\t\t%b\t\t", x, y, s[2:0], s[6], s[5], s[4], s[3]);
     x = 2'b10; y = 2'b11;
  #1 $display("%b - %b = %b.\t%b\t\t%b\t\t%b\t\t", x, y, s[2:0], s[6], s[5], s[4], s[3]);
     x = 2'b01; y = 2'b10;
  #1 $display("%b - %b = %b.\t%b\t\t%b\t\t%b\t\t", x, y, s[2:0], s[6], s[5], s[4], s[3]);
     x = 2'b11; y = 2'b11;
  #1 $display("%b - %b = %b.\t%b\t\t%b\t\t%b\t\t", x, y, s[2:0], s[6], s[5], s[4], s[3]);

 end //main

endmodule //test_alu05
