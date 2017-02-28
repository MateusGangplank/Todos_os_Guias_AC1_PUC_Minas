// --------------------------------------------------------------------------------------
// Guia 09 - Exericio 02 - gerador de pulsos com frequência igual ao triplo da frequência
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// --------------------------------------------------------------------------------------

//--------
//--Clock
//--------

module clock ( clk );
output clk;
reg clk;

initial
begin

clk = 1'b0;

end

always

begin
#6 clk = ~clk;
end

endmodule //--fim module clock

//--------
//--Pulso
//--------

module pulse ( signal, clock );
input clock;
output signal;
reg signal;

always @ ( clock )

begin
signal = 1'b0;
#2 signal = 1'b1;
#2 signal = 1'b0;
#2 signal = 1'b1;
#2 signal = 1'b0; 
#2 signal = 1'b1;
end

endmodule //--fim module pulse

//--------------
//--Teste Pulse
//--------------

module testpulse;

wire clock;
clock clk ( clock );
wire p1;
pulse pulse1 ( p1, clock );

initial begin
$dumpfile ( "guia09_ex02.vcd" );
$dumpvars (1, clock, p1);
#480 $finish;
end
endmodule //--fim module teste pulse