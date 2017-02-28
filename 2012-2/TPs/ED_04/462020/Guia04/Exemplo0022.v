// -------------------------
// Exemplo0022 – FULL SUB
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// full sub 3 bit
// -------------------------
module fullSub3b (output [2:0] s, output carryOut, input [2:0] a, input [2:0] b, input carryIn);
       wire carryOut1, carryOut2;
       fullSub1b FS1(s[0],carryOut1,a[0],b[0],carryIn);
       fullSub1b FS2(s[1],carryOut2,a[1],b[1],carryOut1);
       fullSub1b FS3(s[2],carryOut,a[2],b[2],carryOut2);
endmodule // fullSub3b
// -------------------------
// full sub 1 bit
// -------------------------
module fullSub1b (output s, output carryOut, input a, input b, input carryIn);
       wire s1, s2, s3, aN;
       xor X1(s1, carryIn, b);
       xor X2(s, s1, a);
       not N1(aN, a);
       and A1(s2, s1, aN);
       and A2(s3, b, carryIn);
       or O1(carryOut, s2, s3);
endmodule // fullSub1b
// Testes
module test_fullSub3b;
       // ------------------------- definir dados
       reg [2:0] x;
       reg [2:0] y;
       reg carryIN;
       wire carryOUT;
       wire [2:0] subtracao;
       fullSub3b FS31(subtracao, carryOUT, x, y, carryIN);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0022 - Willian Antonio dos Santos - 462020");
               $display("Test ALU's full subtrator");
               $display("CarryOUT nao tem valor na representacao, ja que estaria acima do sinal\n( Embora faca parte do subtrator completo ).\n");
               x = 0; y = 0; carryIN = 0;
               $monitor("Valor1: %3b - Valor2: %3b - CarryIn : %b = %3b | CarryOut: %b", x, y, carryIN, subtracao, carryOUT);
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("-----------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("-----------------------------------------------------------");
               end
               #1 x = 0; y = 0; carryIN = 1;
               repeat (7) begin
                      #1 y = y + 1;
               end
               #1 $display("-----------------------------------------------------------");
               repeat (7) begin
                      #1 x = x + 1;y = y + 1;
                      repeat (7) begin
                             #1 y = y + 1;
                      end
                      #1 $display("-----------------------------------------------------------");
               end
       end
endmodule // test_fullSub3b