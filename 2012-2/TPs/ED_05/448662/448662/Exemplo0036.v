// ---------------
// Exemplo0036 - SOMADOR ALGÉBRICO COM FLAGS: OVERFLOW, CARRY E ZERO
// Nome: Josemar Alves Caetano
// Matrícula: 448662
// Data: 08/09/2012
// ----------------

// ----------------
// Soma Completa
// ----------------
module somaCompleta(output soma, output carryOut, input a, input b, input carryIn);

//Definição dos fios
wire s0, s1, s2, s3;

//Definição do circuito
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

//Definição dos fios do circuito
wire s0, s1, carrySC01;

//Definição da ALU
xor xor1(s0, operacao, b[0]);
xor xor2(s1, operacao, b[1]);
somaCompleta sc01(saida[0], carrySC01, a[0], s0, operacao);
somaCompleta sc02(saida[1], saida[2], a[1], s1, carrySC01);

endmodule //alu01

// ----------------
// Zero Flag
// ----------------
module zeroFlag(output zero, input [2:0]a);

//Definição dos fios do subcircuito
wire s0;

// Definição da ALU
or or1(s0, a[2], a[1], a[0]);
not not1(zero, s0);

endmodule //zeroFlag

// ----------------
// Carry e overflow
// ----------------
module carryOverflow(output carry, output overflow, input [1:0]a, input [1:0]b, input carryIn);

//Definição dos fios do circuito
wire s0, s1, s2, s3, s4, s5, s6, s7, s8, s9,
     ci_n, b1_n, a0_n;

//Definição do subcircuito carry
and and1(s0, a[0], b[1], b[0]);
and and2(s1, a[1], a[0], b[0]);
and and3(s2, a[1], b[1]);
or or1(s3, s0, s1, s2);
not not1(ci_n, carryIn);
and and4(carry, ci_n, s3);

//Definição do subcircuito overflow
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
// ALU 04
// ----------------
module alu04(output [5:0]saida, input [1:0]a, input [1:0]b, input carryIn);

//Realiza a operação de soma ou subtração
alu01 a1(saida[2:0], a, b, carryIn);

//Verifica se há o flag ZERO
zeroFlag zf(saida[3], saida[2:0]);

//Verifica se há os flags: CARRY e OVERFLOW
carryOverflow caov(saida[4], saida[5], a, b, carryIn);

endmodule //alu04

// ----------------
// Test alu04
// ----------------
module test_alu04;

// ---------------- Definição de dados
reg [1:0] x;
reg [1:0] y;
reg carryIn;
wire [5:0] s;

// ---------------- Instância
alu04 a4(s, x, y, carryIn);

// ----------------- Preparação
  initial begin: start
   x = 2'b00; y = 2'b00;
   carryIn = 1'b0;
  end

// ------------------ Parte principal
  initial begin: main
     $display("Exemplo0036 - Josemar Alves Caetano - 448662.");
   $display("Test ALU's Somador algébrico com flags: ZERO, CARRY e OVERFLOW:\n");

  #1 $display("Teste da operação:\n");
     $display("Flags:\t\tOveflow\tCarry\tZero");
     $display("%b + %b = %b.\t%b\t\t%b\t\t%b", x, y, s[2:0], s[5], s[4], s[3]);
     x = 2'b01; y = 2'b10;
  #1 $display("%b + %b = %b.\t%b\t\t%b\t\t%b", x, y, s[2:0], s[5], s[4], s[3]);
     x = 2'b10; y = 2'b11;
  #1 $display("%b + %b = %b.\t%b\t\t%b\t\t%b", x, y, s[2:0], s[5], s[4], s[3]);
     x = 2'b11; y = 2'b00;
  #1 $display("%b + %b = %b.\t%b\t\t%b\t\t%b", x, y, s[2:0], s[5], s[4], s[3]);
     carryIn = 1'b1;
     x = 2'b11; y = 2'b01;

  #1 $display("\nTeste da operação: Subtração\n");
     $display("Flags:\t\tOveflow\tCarry\tZero");
     $display("%b - %b = %b.\t%b\t\t%b\t\t%b", x, y, s[2:0], s[5], s[4], s[3]);
     x = 2'b10; y = 2'b00;
  #1 $display("%b - %b = %b.\t%b\t\t%b\t\t%b", x, y, s[2:0], s[5], s[4], s[3]);
     x = 2'b01; y = 2'b10;
  #1 $display("%b - %b = %b.\t%b\t\t%b\t\t%b", x, y, s[2:0], s[5], s[4], s[3]);
     x = 2'b11; y = 2'b11;
  #1 $display("%b - %b = %b.\t%b\t\t%b\t\t%b", x, y, s[2:0], s[5], s[4], s[3]);

 end //main

endmodule //test_alu04
