// -------------------------
// Exemplo0032 – Somador e Subtrator com Zero flag
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// Alu Somador e Subtrator com Zero flag 3 bits
// -------------------------
module Alu3b (output [2:0] s, output carryOut, output zero, input [2:0] a, input [2:0] b, input selecao);
       wire carryOut1, carryOut2;
       wire [2:0] s1;
       xor X1(s1[0],b[0],selecao);
       xor X2(s1[1],b[1],selecao);
       xor X3(s1[2],b[2],selecao);
       fullAdder1b FA1(s[0],carryOut1,a[0],s1[0],selecao);
       fullAdder1b FA2(s[1],carryOut2,a[1],s1[1],carryOut1);
       fullAdder1b FA3(s[2],carryOut,a[2],s1[2],carryOut2);
       isZero Z1(zero, s);
endmodule
// -------------------------
// full adder 1 bit
// -------------------------
module fullAdder1b (output s, output carryOut, input a, input b, input carryIn);
       wire s1, s2, s3, s4;
       xor X4(s1, a, b);
       xor X5(s, s1, carryIn);
       and A1(s2, a, b);
       and A2(s3, a, carryIn);
       and A3(s4, carryIn, b);
       or O1(carryOut, s2, s3, s4);
endmodule
// -------------------------
// verifica se a entrada esta em zero, 3 bits
// -------------------------
module isZero(output s, input [2:0] a);
       nor NO1(s, a[0], a[1], a[2]);
endmodule
// Testes
module test_Alu3b;
       // ------------------------- definir dados
       reg [2:0] x;
       reg [2:0] y;
       reg selecao;
       wire carryOUT;
       wire zeroFlag;
       wire [2:0] somaSub;
       Alu3b A31(somaSub, carryOUT, zeroFlag, x, y, selecao);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0032 - Willian Antonio dos Santos - 462020");
               $display("Test ALU's Somador e Subtrator Algebrico com zero flag.\n");
               $display("CarryOUT nao tem valor na representacao, ja que estaria acima do sinal(bit 3)\n( Embora faca parte do somador/subtrator completo ).\n");
               $display("\nSe selecao (+-) for igual a 0 entao e' realizado soma, se 1 subtracao.\n");
               x = 0; y = 0; selecao = 0;
               $monitor("Valor1: %3b | (+-) : %b | Valor2: %3b = %3b | CarryOut: %b | Zero Flag = %b", x, selecao, y, somaSub, carryOUT, zeroFlag);
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("------------------------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("------------------------------------------------------------------------");
               end
               #1 x = 0; y = 0; selecao = 1;
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("------------------------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("------------------------------------------------------------------------");
               end
       end
endmodule