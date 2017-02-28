//Nome : Guilherme Rodrigues Melo de Oliveira
//Matricula : 427409
// ---------------------------
// -- test pulse generator (6)
// ---------------------------
module clock ( clk );
output clk;
reg      clk;
initial
  begin
   clk = 1'b0;
  end
always
  begin
   #6 clk = ~clk;
  end
endmodule
module pulse ( signal, clock );
input  clock;
output signal;
reg      signal;
always @ ( clock )
  begin
    signal = 1'b0;
#6  signal = 1'b1;
#6  signal = 1'b0;
#6  signal = 1'b1;
end
endmodule 
module Exemplo0046;
wire  clock;
clock clk ( clock );
wire  p1;
pulse   pulse1   ( p1, clock );
initial begin
  $dumpfile ( "Exemplo0046.vcd" );
  $dumpvars ( 1, clock, p1);
#376 $finish;
end
endmodule //