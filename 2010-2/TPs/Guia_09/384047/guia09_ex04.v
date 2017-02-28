// ------------------------------------------------------------------------------------------------
// Guia 09 - Exericio 04 - gerador de pulsos sincronizado com as variações de descida de "clock" e
// duração de 5 períodos desse "clock".
// Nome: Eduardo de Abreu Fortes
// Matricula: 384047
// -------------------------------------------------------------------------------------------------

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
#2 clk = ~clk;
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
#10 signal = 1'b1;
#10 signal = 1'b0;
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
$dumpfile ( "guia09_ex04.vcd" );
$dumpvars (1, clock, p1);
#480 $finish;
end

endmodule //--fim module teste pulse