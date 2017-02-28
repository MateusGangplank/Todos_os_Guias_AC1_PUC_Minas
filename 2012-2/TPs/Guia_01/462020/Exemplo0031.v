// -------------------------
// Exemplo0031 - F4
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output [3:0] s, output [3:0] p, input [3:0] a, input [3:0] b);
       and A1 ( s[0], a[0], b[0]);
       and A2 ( s[1], a[1], b[1]);
       and A3 ( s[2], a[2], b[2]);
       and A4 ( s[3], a[3], b[3]);
       //
       or O1 ( p[0], a[0], b[0]);
       or O2 ( p[1], a[1], b[1]);
       or O3 ( p[2], a[2], b[2]);
       or O4 ( p[3], a[3], b[3]);
endmodule // f4

module test_f4;
       // ------------------------- definir dados
       reg [3:0] x;
       reg [3:0] y;
       wire [3:0] z;
       wire [3:0] w;
       f4 modulo (z, w, x, y);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0031 - Willian Antonio dos Santos - 462020");
               $display("Test LU's module");
               x = 4'b0011; y = 4'b0101;
               // projetar testes do modulo
               #1 $display("Entradas:%3b %3b | Saida And:%3b | Saida Or:%3b",x,y,z,w);
       end
endmodule // test_f4