// ------------------------------------------------------------------------------------
// Guia 09 - Exericio 05 - gerador de pulsos sincronizado apenas 
// com as variações de subida de "clock" e duração do triplo da frequência do "clock".
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -------------------------------------------------------------------------------------

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
#12 clk = ~clk;
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
signal = 1'b1;
#4 signal = 1'b0;
#4 signal = 1'b1;
#4 signal = 1'b0;
#4 signal = 1'b1;
#4 signal = 1'b0;
end

endmodule // --fim module pulse

//--------------
//--Teste Pulse
//--------------

module testpulse;
wire clock;
clock clk ( clock );
wire p1;
pulse pulse1 ( p1, clock );

initial begin
$dumpfile ( "guia09_ex05.vcd" );
$dumpvars (1, clock, p1);
#480 $finish;
end

endmodule //--fim module teste pulse