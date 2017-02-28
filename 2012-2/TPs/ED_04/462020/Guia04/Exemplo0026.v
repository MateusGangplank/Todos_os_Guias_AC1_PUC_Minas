// -------------------------
// Exemplo0026Extra – somador e subtrator selecionavel
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// somador e subtrator selecionavel
// -------------------------
module addESub3b (output [2:0] s, output carryOut, input [2:0] a, input [2:0] b, input carryIn);
       wire carryOut1, carryOut2;
       wire [2:0] s1;
       wire [2:0] s2;
       comple23b C231(s1, b); // complemento de 2 de b em s1
       mux2IN3b M1(s2, b, s1,carryIn); // selecao por carryIn dos 3 bits que irao para s2. Se sera' b ou seu complemento de 2, s1.
       fullAdder1b FA1(s[0],carryOut1,a[0],s2[0],0);
       fullAdder1b FA2(s[1],carryOut2,a[1],s2[1],carryOut1);
       fullAdder1b FA3(s[2],carryOut,a[2],s2[2],carryOut2);
endmodule // addESub3b
// -------------------------
// full adder 1 bit
// -------------------------
module fullAdder1b (output s, output carryOut, input a, input b, input carryIn);
       wire s1, s2, s3, s4;
       xor X1(s1, a, b);
       xor X2(s, s1, carryIn);
       and A1(s2, a, b);
       and A2(s3, a, carryIn);
       and A3(s4, carryIn, b);
       or O1(carryOut, s2, s3, s4);
endmodule // fullAdder1b
// -------------------------
// mux para selecao de 2 entradas de 3 bits para saida de 3 bits
// -------------------------
module mux2IN3b (output [2:0] s, input [2:0] a, input [2:0] b, input selecao);
       wire selecaoN;
       wire [2:0] s1;
       wire [2:0] s2;
       not N1 ( selecaoN, selecao);
       and A4 ( s1[0], a[0], selecaoN);
       and A5 ( s1[1], a[1], selecaoN);
       and A6 ( s1[2], a[2], selecaoN);
       and A7 ( s2[0], b[0], selecao);
       and A8 ( s2[1], b[1], selecao);
       and A9 ( s2[2], b[2], selecao);
       or O2 ( s[0], s2[0], s1[0]);
       or O3 ( s[1], s2[1], s1[1]);
       or O4 ( s[2], s2[2], s1[2]);
endmodule // mux2IN3b
// -------------------------
// complemento de 2 para 3 bits
// -------------------------
module comple23b (output [2:0] s, input [2:0] a);
       wire [2:0] s1;
       comple13b CP11(s1, a);
       add13b ADD11(s, s1);
endmodule // comple23b
// -------------------------
// complemento de 1 - 3 bits
// -------------------------
module comple13b (output [2:0] s, input [2:0] a);
       not N2(s[0], a[0]);
       not N3(s[1], a[1]);
       not N4(s[2], a[2]);
endmodule // comple13b
// -------------------------
// Adiciona 1 em um numero de 3 bits
// -------------------------
module add13b (output [2:0] s, input [2:0] a);
       wire s1;
       not N5(s[0], a[0]);
       xor X3(s[1], a[1], a[0]);
       and A10(s1, a[1], a[0]);
       xor X4(s[2], a[2], s1);
endmodule // add13b
// Testes
module test_addESub3b;
       // ------------------------- definir dados
       reg [2:0] x;
       reg [2:0] y;
       reg select;
       wire carryOUT;
       wire [2:0] result;
       addESub3b AES31(result, carryOUT, x, y, select);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0026Extra - Willian Antonio dos Santos - 462020");
               $display("Test ALU's - Somador e Subtrator selecionavel");
               $display("CarryOUT nao tem valor na representacao, ja que estaria acima do sinal\n( Embora faca parte do somador completo ).\n");
               $display("O bit de selecao em 0 e' soma, em 1 e' subtracao.\n");
               x = 0; y = 0; select = 0;
               $monitor("Valor1: %3b | Valor2: %3b | soma ou sub? : %b | = %3b | CarryOut: %b", x, y, select, result, carryOUT);
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("------------------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("------------------------------------------------------------------");
               end
               #1 x = 0; y = 0; select = 1;
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("------------------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("------------------------------------------------------------------");
               end
       end
endmodule // test_addESub3b