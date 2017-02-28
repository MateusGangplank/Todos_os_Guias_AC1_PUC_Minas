// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// full adder 3 bit
// -------------------------
module fullAdder3b (output [2:0] s, output carryOut, input [2:0] a, input [2:0] b, input carryIn);
       wire carryOut1, carryOut2;
       fullAdder1b FA1(s[0],carryOut1,a[0],b[0],carryIn);
       fullAdder1b FA2(s[1],carryOut2,a[1],b[1],carryOut1);
       fullAdder1b FA3(s[2],carryOut,a[2],b[2],carryOut2);
endmodule // fullAdder3b
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
// Testes
module test_fullAdder3b;
       // ------------------------- definir dados
       reg [2:0] x;
       reg [2:0] y;
       reg carryIN;
       wire carryOUT;
       wire [2:0] soma;
       fullAdder3b FA31(soma, carryOUT, x, y, carryIN);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0021 - Willian Antonio dos Santos - 462020");
               $display("Test ALU's full adder");
               $display("CarryOUT nao tem valor na representacao, ja que estaria acima do sinal\n( Embora faca parte do somador completo ).\n");
               x = 0; y = 0; carryIN = 0;
               $monitor("Valor1: %3b + Valor2: %3b + CarryIn : %b = %3b | CarryOut: %b", x, y, carryIN, soma, carryOUT);
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
endmodule // test_fullAdder3b