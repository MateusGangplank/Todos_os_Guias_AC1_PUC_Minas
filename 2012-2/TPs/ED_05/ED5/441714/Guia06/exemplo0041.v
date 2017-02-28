// ---------------------------
// -- test clock generator (1)
// Yousef Otacilio
// 441714
// Exemplo 0041
// ---------------------------

module clock ( clk );
output clk;
reg clk;

initial begin
clk = 1'b0;
end

always
begin
#12 clk = ~clk;
end

endmodule // clock ( )

module Exemplo0041;
wire clk;
clock CLK1 ( clk );

initial begin

$display ( "Yousef - 441714 \n" );
$dumpfile ( "Exemplo041.vcd" );
$monitor($time, ,clk);
$dumpvars(0);
#100 $finish;
end
endmodule // Exemplo041 ()