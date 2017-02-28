// -------------------------
// Exemplo0034 - lu3
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// unidade logica 3 ( lu3 )
// -------------------------
module lu3 (output s, input a, input b, input [1:0] selecao);
       wire s1,s2,s3,s4,s5,s6;
       // Portas Principais da LU
       xor X1 ( s1, a, b);
       xnor XN1 ( s2, a, b);
       or O1 ( s3, a, b);
       nor NO1 ( s4, a, b);
       // Mux's
       mux Mx1 (s5,s4,s3,selecao[0]);
       mux Mx2 (s6,s2,s1,selecao[0]);
       mux Mx3 (s,s6,s5,selecao[1]);
endmodule // lu3

module mux (output s, input a, input b, input selecao);
       wire selecao2,s7,s8;
       not N1 ( selecao2, selecao);
       and A2 ( s7, a, selecao);
       and A3 ( s8, b, selecao2);
       or O2 ( s, s7, s8);
endmodule // mux

module test_lu3;
       // ------------------------- definir dados
       reg x;
       reg y;
       reg [1:0] select;
       wire z;
       lu3 modulo (z, x, y, select);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0034 - Willian Antonio dos Santos - 462020");
               $display("Test lu3 module");
               x = 0; y = 0;select = 0;
               $monitor("Entradas: %b %b | Selecao: %2b => Saidas: %b",x,y,select,z);
               #1 x = 0; y = 1;select = 0;
               #1 x = 1; y = 0;select = 0;
               #1 x = 1; y = 1;select = 0;
               #1 $display("----------------------------------------");
               #1 x = 0; y = 0;select = 1;
               #1 x = 0; y = 1;select = 1;
               #1 x = 1; y = 0;select = 1;
               #1 x = 1; y = 1;select = 1;
               #1 $display("----------------------------------------");
               #1 x = 0; y = 0;select = 2;
               #1 x = 0; y = 1;select = 2;
               #1 x = 1; y = 0;select = 2;
               #1 x = 1; y = 1;select = 2;
               #1 $display("----------------------------------------");
               #1 x = 0; y = 0;select = 3;
               #1 x = 0; y = 1;select = 3;
               #1 x = 1; y = 0;select = 3;
               #1 x = 1; y = 1;select = 3;
               #1 $display("----------------------------------------");
       end
endmodule // test_lu3