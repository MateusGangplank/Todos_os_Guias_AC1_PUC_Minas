// ---------------------------
// Exemplo0047 – Gerador de pulsos de periodo 5
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// ---------------------------
`include "clock.v"
// ---------------------------
// -- pulso de periodo 5
// ---------------------------
module pulse5 ( signal, clock );
       input clock;
       output signal;
       reg signal;
       initial begin
              signal = 1'b0;
       end
       always @ ( negedge clock ) begin
              signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
           #5 signal = 1'b1;
           #5 signal = 1'b0;
       end
endmodule
// ---------------------------
// -- test pulse5
// ---------------------------
module Exemplo0047;
       wire clock;
       clock clk ( clock );
       wire p;
       pulse5 pS5 ( p, clock );
       initial begin
               $dumpfile ( "Exemplo0047.vcd" );
               $dumpvars ( 1, clock, p );
          #480 $finish;
       end
endmodule