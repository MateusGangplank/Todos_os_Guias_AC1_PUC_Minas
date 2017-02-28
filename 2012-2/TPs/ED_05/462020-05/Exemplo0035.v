// -------------------------
// Exemplo0035 � Soma/Sub ou incremento/decremento selecionavel, c/ flag de Zero, Overflow, sinal e comparac�es relacionais
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// Alu com Somador e Subtrator ou incremento/decremento selecionavel. ( Flags: zero, sinal, overflow, comparacao )
// se operacao = 00 - Soma de a e b
//             = 01 - Subtracao de a e b
//             = 10 - Incrementa a e ignora b
//             = 11 - decrementa a e ignora b
// -------------------------
module Alu3b (output [2:0] s, output carryDet, output zero, output overflow, output sinal, output [2:0] relative,
              input [2:0] a, input [2:0] b, input [1:0] operacao);

       wire carryOut1, carryOut2, carryOut3;
       wire [2:0] s1;
       wire [2:0] s2;
       reg [2:0] unidade = 1;
       
       mux3b Mx31(s1, b, unidade, operacao[1]);
       xor X1(s2[0],s1[0],operacao[0]);
       xor X2(s2[1],s1[1],operacao[0]);
       xor X3(s2[2],s1[2],operacao[0]);

       fullAdder1b FA1(s[0],carryOut1,a[0],s2[0],operacao[0]);
       fullAdder1b FA2(s[1],carryOut2,a[1],s2[1],carryOut1);
       fullAdder1b FA3(s[2],carryOut3,a[2],s2[2],carryOut2);

       isOverflow iO1(overflow, a[2], s2[2], s[2]);

       xor X6(carryDet,carryOut3, operacao[0]);

       sinalDt SD1(sinal, overflow, s[2]);

       isZero Z1(zero, s);

       uRelacionalFull URF1(relative, a, b);
endmodule
// -------------------------
// Verifica overflow a partir do sinal dos valores A e B e do resultado da soma deles.
// -------------------------
module isOverflow(output s, input sinalA, input sinalB, input sinalSaida);
       wire s1, s2;
       xnor XN1(s1, sinalB, sinalA);
       xor X4(s2, sinalSaida, sinalA);
       and A1(s, s2, s1);
endmodule
// -------------------------
// Retorna o sinal que a soma deve ter a partir do sinal da saida e do overflow.
// -------------------------
module sinalDt(output s, input overflow, input sinalSaida);
       xor X5(s, sinalSaida, overflow);
endmodule
// -------------------------
// Retorna 3 bits indicando com 1 se (a < b), (a == b) e (a > b). a e b com 3 bit ( Ultimo � o sinal ).
// -------------------------
module uRelacionalFull(output [2:0] s, input [2:0] a, input [2:0] b);
       wire [2:0] s1;
       wire s2, s3, s4, s5, s6, ns4, s7, s8, diff;
       uRelacional2b UR21(s1, a[1:0], b[1:0]);
       xor X6(s2, s1[0], a[2]);
       xor X7(s3, s1[2], a[2]);
       xnor XN2(s4, a[2], b[2]);
       and A2(s[1], s1[1], s4);
       not N1(diff, s[1]);
       and A3(s5, s2, s4, diff);
       and A4(s6, s3, s4, diff);
       not N2(ns4, s4);
       and A5(s7, ns4, a[2]);
       and A6(s8, ns4, b[2]);
       or O1(s[0], s5, s7);
       or O2(s[2], s6, s8);
endmodule
// -------------------------
// Retorna 3 bits indicando com 1 se (a < b), (a == b) e (a > b). a e b com 2 bit.
// -------------------------
module uRelacional2b(output [2:0] s, input [1:0] a, input [1:0] b);
       wire [2:0] s1;
       wire [2:0] s2;
       wire s3, s4;
       uRelacional1b UR11(s1, a[0], b[0]);
       uRelacional1b UR12(s2, a[1], b[1]);
       and A7(s[1], s1[1], s2[1]);
       and A8(s3, s2[1], s1[2]);
       and A9(s4, s2[1], s1[0]);
       or O3(s[2], s3, s2[2]);
       or O4(s[0], s4, s2[0]);
endmodule
// -------------------------
// Retorna 3 bits indicando com 1 se (a < b), (a == b) e (a > b). a e b com 1 bit.
// -------------------------
module uRelacional1b(output [2:0] s, input a, input b);
       wire an, bn;
       xnor XN3(s[1], a, b);
       not N3(an, a);
       not N4(bn, b);
       and A10(s[0], an, b);
       and A11(s[2], bn, a);
endmodule
// -------------------------
// full adder 1 bit
// -------------------------
module fullAdder1b (output s, output carryOut, input a, input b, input carryIn);
       wire s1, s2, s3, s4;
       xor X8(s1, a, b);
       xor X9(s, s1, carryIn);
       and A12(s2, a, b);
       and A13(s3, a, carryIn);
       and A14(s4, carryIn, b);
       or O5(carryOut, s2, s3, s4);
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
       not N5 ( selecao2, selecao);
       and A15 ( s7, a, selecao);
       and A16 ( s8, b, selecao2);
       or O6 ( s, s7, s8);
endmodule // mux
// Testes
module test_Alu3b;
       // ------------------------- definir dados
       wire carryOUT, overFlow, zeroFlag, sinal;
       reg [1:0] selecao;
       reg [2:0] x;
       reg [2:0] y;
       wire [2:0] somaSub;
       wire [2:0] comp;
       Alu3b AL31(somaSub, carryOUT, zeroFlag, overFlow, sinal, comp, x, y, selecao);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0035 - Willian Antonio dos Santos - 462020");
               $display("Test ALU's Soma/Sub ou inc/dec - flag zero, overflow, sinal, relacoes.");
               $display("Carry nao tem valor na representacao.");
               $display("\nSe operacao for igual a 00 ou 01 entao e' realizado soma ou subtracao;\nse 10 ou 11, entao incremento ou decremento respectivamente.\n");
               x = 0; y = 0; selecao = 1;
               $display("Valor1 | Op | Valor2 | Resultado | Carry | Sinal | Zero | overflow | <  ==  > ");
               $monitor("  %3b  | %2b |   %3b  |   = %3b   |    %b  |   %b   |   %b  |  %b       | %b  %b  %b", x, selecao, y, somaSub, carryOUT, sinal, zeroFlag, overFlow, comp[0],comp[1],comp[2]);
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