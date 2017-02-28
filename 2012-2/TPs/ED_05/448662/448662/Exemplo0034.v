// ---------------
// Exemplo0034 - SOMADOR ALGÉBRICO COM FLAGS: ZERO E OVERFLOW
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

// --------------
// Meia Soma
// --------------
module meiaSoma(output soma, output vai_um, input a, input b);

xor xor1(soma, a, b);
and and1(vai_um, a, b);

endmodule //meiaSoma

// ---------------
// Decrementa
// ---------------
module decrementa(output [3:0]s, input [2:0]a);

//Definição dos fios do subcircuito
wire carryO0, carryO1, carryO2, carryO3, carryO4, carryO5,
     somaP0, somaP1, somaP2, somaP3, somaP4, somaP5;

//Definição do operador constante de valor 001
 reg [2:0]cons = 3'b111;

//Definição do decremento
meiaSoma ms1(s[0], carryO0, a[0], cons[0]);
meiaSoma ms2(somaP0, carryO1, carryO0, a[1]);
meiaSoma ms3(s[1], carryO2, somaP0, cons[1]);
meiaSoma ms4(somaP1, carryO3, carryO2, carryO1);
meiaSoma ms5(somaP2, carryO4, somaP1, a[2]);
meiaSoma ms6(s[2], carryO5, somaP2, cons[2]);
or or1(s[3], carryO3, carryO4, carryO5);

endmodule //decrementa

// ----------------
// ALU 06
// ----------------
module alu06(output [4:0]saida, input [1:0]a, input [1:0]b, input carryIn);

//Definição do fio que receberá o resultado da operação
wire [2:0]saida1;

//Realiza a operação de adição ou subtração
alu01 a1(saida1, a, b, carryIn);

//Decrementa 001 do resultado
decrementa dec(saida[3:0], saida1);

//Verifica se há o flag ZERO
zeroFlag zf(saida[4], saida[2:0]);

endmodule //alu06

// ----------------
// test alu06
// ----------------
module test_alu06;

// ---------------- Definição de dados
reg [1:0] x;
reg [1:0] y;
reg carryIn;
wire [4:0]s;

// ----------------- Intância
 alu06 a6(s, x, y, carryIn);

// ------------------ Preparação
 initial begin: start
  x = 2'b00; y = 2'b00;
  carryIn = 1'b0;
 end //start

// ------------------- Parte principal
 initial begin: main
   $display("Exemplo0034 - Josemar Alves Caetano - 448662.");
   $display("Test ALU's Somador algébrico com flags: Zero e Oveflow:\n");

  #1 $display("Teste da operação: Adição\n");
     $display("Flags:\t\t\tOveflow\tZero");
     $display("%b + %b - 1 = %b.\t%b\t\t%b", x, y, s[2:0], s[3], s[4]);
     x = 2'b01; y = 2'b10;
  #1 $display("%b + %b - 1 = %b.\t%b\t\t%b", x, y, s[2:0], s[3], s[4]);
     x = 2'b10; y = 2'b11;
  #1 $display("%b + %b - 1 = %b.\t%b\t\t%b", x, y, s[2:0], s[3], s[4]);
     x = 2'b11; y = 2'b00;
  #1 $display("%b + %b - 1 = %b.\t%b\t\t%b", x, y, s[2:0], s[3], s[4]);
     carryIn = 1'b1;
     x = 2'b11; y = 2'b01;

  #1 $display("\nTeste da operação: Subtração\n");
     $display("Flags:\t\t\tOveflow\tZero");
     $display("%b - %b - 1 = %b.\t%b\t\t%b", x, y, s[2:0], s[3], s[4]);
     x = 2'b10; y = 2'b00;
  #1 $display("%b - %b - 1 = %b.\t%b\t\t%b", x, y, s[2:0], s[3], s[4]);
     x = 2'b01; y = 2'b10;
  #1 $display("%b - %b - 1 = %b.\t%b\t\t%b", x, y, s[2:0], s[3], s[4]);
     x = 2'b11; y = 2'b11;
  #1 $display("%b - %b - 1 = %b.\t%b\t\t%b", x, y, s[2:0], s[3], s[4]);

 end //begin
 
endmodule //test_alu06