// ---------------------------
// Exemplo0044 – Gerador de pulsos 3 freq CLK
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// ---------------------------
`include "clock.v"
// ---------------------------
// -- pulso 3 vezes a frequencia do clock de Exemplo0041
// ---------------------------
module pulse3fk ( signal, clock );
       input clock;
       output signal;
       reg signal;
       initial begin
              signal = 1'b0;
       end
       always @ ( posedge clock ) begin
              signal = 1'b1;
           #4 signal = 1'b0;
           #4 signal = 1'b1;
           #4 signal = 1'b0;
           #4 signal = 1'b1;
           #4 signal = 1'b0;
       end
endmodule
// ---------------------------
// -- test pulse3fk
// ---------------------------
module Exemplo0044;
       wire clock;
       clock clk ( clock );
       wire p;
       pulse3fk p3fk ( p, clock );
       initial begin
               $dumpfile ( "Exemplo0044.vcd" );
               $dumpvars ( 1, clock, p );
          #480 $finish;
       end
endmodule