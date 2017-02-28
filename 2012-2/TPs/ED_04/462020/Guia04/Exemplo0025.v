// -------------------------
// Exemplo0025 – Complemento de 2 para 3 bits
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
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
       not N1(s[0], a[0]);
       not N2(s[1], a[1]);
       not N3(s[2], a[2]);
endmodule // comple13b
// -------------------------
// Adiciona 1 em um numero de 3 bits
// -------------------------
module add13b (output [2:0] s, input [2:0] a);
       wire s1;
       not N4(s[0], a[0]);
       xor X1(s[1], a[1], a[0]);
       and A1(s1, a[1], a[0]);
       xor X2(s[2], a[2], s1);
endmodule // add13b
// Testes
module test_comple23b;
       // ------------------------- definir dados
       reg [2:0] x;
       wire [2:0] s;
       comple23b C231(s, x);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0025 - Willian Antonio dos Santos - 462020");
               $display("Teste de ALU, complemento de 2 - 3 bits\n");
               #1 $display("------------------------------------------");
               x = 0;
               $monitor("Valor: %3b | Complemento de 2: %3b", x, s);
               repeat (7) begin
                      #1 x = x + 1;
               end
               #1 $display("------------------------------------------");
       end
endmodule // test_comple23b