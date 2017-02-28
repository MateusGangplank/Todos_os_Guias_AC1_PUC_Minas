// -------------------------
// Exemplo0033 – Soma/Sub c/ Zero flag ou incremento/decremento selecionavel
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// Alu  com Somador e Subtrator com Zero flag 3 bits ou incremento/decremento selecionavel.
// se operacao = 00 - Soma de a e b
//             = 01 - Subtracao de a e b
//             = 10 - Incrementa a e ignora b
//             = 11 - decrementa a e ignora b
// -------------------------
module Alu3b (output [2:0] s, output carryOut, output zero, input [2:0] a, input [2:0] b, input [1:0] operacao);
       wire carryOut1, carryOut2;
       wire [2:0] s1;
       wire [2:0] s2;
       reg [2:0] unidade = 1;
       mux3b Mx31(s1, b, unidade, operacao[1]);
       xor X1(s2[0],s1[0],operacao[0]);
       xor X2(s2[1],s1[1],operacao[0]);
       xor X3(s2[2],s1[2],operacao[0]);
       fullAdder1b FA1(s[0],carryOut1,a[0],s2[0],operacao[0]);
       fullAdder1b FA2(s[1],carryOut2,a[1],s2[1],carryOut1);
       fullAdder1b FA3(s[2],carryOut,a[2],s2[2],carryOut2);
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
// -------------------------
// Mux para selecionar entre 2 entradas de 3 bits
// -------------------------
module mux3b (output [2:0] s, input [2:0] a, input [2:0] b, input selecao);
       mux Mx1 (s[0],b[0],a[0],selecao);
       mux Mx2 (s[1],b[1],a[1],selecao);
       mux Mx3 (s[2],b[2],a[2],selecao);
endmodule // mux3b
// -------------------------
// Mux para selecionar entre duas saidas
// -------------------------
module mux (output s, input a, input b, input selecao);
       wire selecao2,s7,s8;
       not N1 ( selecao2, selecao);
       and A4 ( s7, a, selecao);
       and A5 ( s8, b, selecao2);
       or O2 ( s, s7, s8);
endmodule // mux
// Testes
module test_Alu3b;
       // ------------------------- definir dados
       reg [2:0] x;
       reg [2:0] y;
       reg [1:0] selecao;
       wire carryOUT;
       wire zeroFlag;
       wire [2:0] somaSub;
       Alu3b A31(somaSub, carryOUT, zeroFlag, x, y, selecao);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0033 - Willian Antonio dos Santos - 462020");
               $display("Test ALU's Soma/Sub com zero flag ou incremento/decremento.\n");
               $display("CarryOUT nao tem valor na representacao.");
               $display("\nSe operacao for igual a 00 ou 01 entao e' realizado soma ou subtracao;\nse 10 ou 11, entao incremento ou decremento respectivamente.\n");
               x = 0; y = 0; selecao = 0;
               $monitor("Valor1: %3b | operacao : %2b | Valor2: %3b = %3b | CarryOut: %b | Zero Flag = %b", x, selecao, y, somaSub, carryOUT, zeroFlag);
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("-----------------------------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("-----------------------------------------------------------------------------");
               end
               #1 x = 0; y = 0; selecao = 1;
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("-----------------------------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("-----------------------------------------------------------------------------");
               end
               #1 x = 0; y = 0; selecao = 2;
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("-----------------------------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("-----------------------------------------------------------------------------");
               end
               #1 x = 0; y = 0; selecao = 3;
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("-----------------------------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("-----------------------------------------------------------------------------");
               end
       end
endmodule