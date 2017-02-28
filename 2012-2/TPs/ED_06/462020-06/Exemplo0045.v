// ---------------------------
// Exemplo0045 – Gerador de pulsos 1/2 freq CLK
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// ---------------------------
`include "clock.v"
// ---------------------------
// -- pulso metade da frequencia do clock de Exemplo0041
// ---------------------------
module pulseMfk ( signal, clock );
       input clock;
       output signal;
       reg signal;
       initial begin
              signal = 1'b0;
       end
       always @ ( posedge clock ) begin
              signal = 1'b1;
           #24 signal = 1'b0;
           #24 signal = 1'b0;
       end
endmodule
// ---------------------------
// -- test pulseMfk
// ---------------------------
module Exemplo0045;
       wire clock;
       clock clk ( clock );
       wire p;
       pulseMfk pMfk ( p, clock );
       initial begin
               $dumpfile ( "Exemplo0045.vcd" );
               $dumpvars ( 1, clock, p );
          #480 $finish;
       end
endmodule