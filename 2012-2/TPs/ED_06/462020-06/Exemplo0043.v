// ---------------------------
// Exemplo0043 – Gerador de pulsos
// Nome: Willian Antonio dos Santos
// Matricula: 462020
// ---------------------------
`include "clock.v"
// ---------------------------
// -- clock generator (3), pulso1
// ---------------------------
module pulse1 ( signal, clock );
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
endmodule // pulse
// ---------------------------
// -- pulso2
// ---------------------------
module pulse2 ( signal, clock );
       input clock;
       output signal;
       reg signal;
       initial begin
              signal = 1'b0;
       end
       always @ ( posedge clock ) begin
              signal = 1'b1;
           #5 signal = 1'b0;
       end
endmodule // pulse
// ---------------------------
// -- pulso3
// ---------------------------
module pulse3 ( signal, clock );
       input clock;
       output signal;
       reg signal;
       initial begin
              signal = 1'b0;
       end
       always @ ( negedge clock ) begin
              signal = 1'b1;
          #15 signal = 1'b0;
          #15 signal = 1'b1;
       end
endmodule // pulse
// ---------------------------
// -- pulso4
// ---------------------------
module pulse4 ( signal, clock );
       input clock;
       output signal;
       reg signal;
       initial begin
              signal = 1'b0;
       end
       always @ ( negedge clock ) begin
              signal = 1'b1;
          #20 signal = 1'b0;
          #20 signal = 1'b1;
          #20 signal = 1'b0;
       end
endmodule // pulse
// ---------------------------
// -- test clock generator (3)
// ---------------------------
module Exemplo0043;
       wire clock;
       clock clk ( clock );
       wire p1,p2,p3,p4;
       pulse1 pls1 ( p1, clock );
       pulse2 pls2 ( p2, clock );
       pulse3 pls3 ( p3, clock );
       pulse4 pls4 ( p4, clock );
       initial begin
               $dumpfile ( "Exemplo0043.vcd" );
               $dumpvars ( 1, clock, p1, p2, p3, p4 );
          #480 $finish;
       end
endmodule // Exemplo0043