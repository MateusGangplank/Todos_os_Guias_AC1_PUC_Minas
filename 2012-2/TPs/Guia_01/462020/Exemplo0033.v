// -------------------------
// Exemplo0033 - lu2
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// -------------------------
// -------------------------
// unidade logica 2 ( lu2 )
// -------------------------
module lu2 (output s, output p, input a, input b, input selecao);
       wire s1,s2,s3,s4;
       // Portas Principais da LU
       and A1 ( s1, a, b);
       or O1 ( s2, a, b);
       nand NA1 ( s3, a, b);
       nor NO1 ( s4, a, b);
       // Mux's
       mux Mx1 (s,s3,s1,selecao);
       mux Mx2 (p,s4,s2,selecao);
endmodule // lu2

module mux (output s, input a, input b, input selecao);
       wire selecao2,s3,s4;
       not N1 ( selecao2, selecao);
       and A2 ( s3, a, selecao);
       and A3 ( s4, b, selecao2);
       or O2 ( s, s3, s4);
endmodule // mux

module test_lu2;
       // ------------------------- definir dados
       reg x;
       reg y;
       reg select;
       wire z,w;
       lu2 modulo (z, w, x, y, select);
       // ------------------------- parte principal
       initial begin
               $display("Exemplo0033 - Willian Antonio dos Santos - 462020");
               $display("Test lu2 module");
               x = 0; y = 0;select = 0;
               $monitor("Entradas: %b %b | Selecao: %b => Saidas: %b - %b",x,y,select,z,w);
               #1 x = 0; y = 1;select = 0;
               #1 x = 1; y = 0;select = 0;
               #1 x = 1; y = 1;select = 0;
               #1 $display("-------------------------------------------");
               #1 x = 0; y = 0;select = 1;
               #1 x = 0; y = 1;select = 1;
               #1 x = 1; y = 0;select = 1;
               #1 x = 1; y = 1;select = 1;
               #1 $display("-------------------------------------------");
       end
endmodule // test_lu2