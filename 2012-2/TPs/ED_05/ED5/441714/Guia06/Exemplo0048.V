// ---------------------------
// -- test clock generator (4)
// Yousef Otacilio
// 441714
// Exemplo 0048
// ---------------------------

`include "clock.v"


module pulse1 ( signal, clock );
input clock;
output signal;
reg signal;
always @ (clock )
begin
signal = 1'b1;
#60 signal = 1'b0;
#60 signal = 1'b1;

end
endmodule // pulse



module Exemplo0048;
wire clock;
clock clk ( clock );

wire p1;

pulse1 pls1 ( p1, clock );
initial begin



$dumpfile ( " Exemplo0048.vcd" );
$display ( "Yousef - 441714 \n" );
$dumpvars ( 1, clock, p1);

$display ( "                  time - clock - p" );
$monitor ($time,"       ", clock, "     ",p1);

#480 $finish;
end
endmodule // Exemplo0048