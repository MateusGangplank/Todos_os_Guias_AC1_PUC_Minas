/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Exercicio05 - GUIA10
*
*/


`include "FlipClock.v"

module RAM1x4 ( output [3:0]sai, input [3:0]d, input clk, input clear, input addr, input rw );

wire No1;
wire No2;
wire No3;
wire No4;
wire s;

wire [3:0] q;
wire [3:0] qnot;

and AND1    ( s, addr, clk, rw );

not NOT1    ( No1, d[0] );
not NOT2    ( No2, d[1] );
not NOT3    ( No3, d[2] );
not NOT4    ( No4, d[3] );

jkff FLIP1  ( q[0], qnot[0], d[0], No1, s, clear );
jkff FLIP2  ( q[1], qnot[1], d[1], No2, s, clear );
jkff FLIP3  ( q[2], qnot[2], d[2], No3, s, clear );
jkff FLIP4  ( q[3], qnot[3], d[3], No4, s, clear );

and AND2    ( sai[0], addr, q[0] );
and AND3    ( sai[1], addr, q[1] );
and AND4    ( sai[2], addr, q[2] );
and AND5    ( sai[3], addr, q[3] );

endmodule

module RAM4x8 ( output [7:0]sai, input [7:0]data, input clk, input clear, input[1:0] addr, input rw );

reg constante = 1'b1;

wire [3:0]s1A;
wire [3:0]s1B;

wire [3:0]s2A;
wire [3:0]s2B;

wire [3:0]s3A;
wire [3:0]s3B;

wire [3:0]s4A;
wire [3:0]s4B;

wire [3:0]dmx;

wire [7:0]smux0;
wire [7:0]smux1;
wire [7:0]smux2;
wire [7:0]smux3;

wire [3:0]in1;
wire [3:0]in2;

assign in1 = data[3:0];
assign in2 = data[7:4];

dmx2bits DMUX    ( dmx[3], dmx[2], dmx[1], dmx[0], constante, addr );

RAM1x4 MEMORIA1A ( s1A, in1, clk, clear, dmx[0], rw );
RAM1x4 MEMORIA1B ( s1B, in2, clk, clear, dmx[0], rw );

RAM1x4 MEMORIA2A ( s2A, in1, clk, clear, dmx[1], rw );
RAM1x4 MEMORIA2B ( s2B, in2, clk, clear, dmx[1], rw );

RAM1x4 MEMORIA3A ( s3A, in1, clk, clear, dmx[2], rw );
RAM1x4 MEMORIA3B ( s3B, in2, clk, clear, dmx[2], rw );

RAM1x4 MEMORIA4A ( s4A, in1, clk, clear, dmx[3], rw );
RAM1x4 MEMORIA4B ( s4B, in2, clk, clear, dmx[3], rw );


assign smux0[3:0] = s1A;
assign smux0[7:4] = s1B;

assign smux1[3:0] = s2A;
assign smux1[7:4] = s2B;

assign smux2[3:0] = s3A;
assign smux2[7:4] = s3B;

assign smux3[3:0] = s4A;
assign smux3[7:4] = s4B;

mux1bit2 MUX  ( sai, smux3, smux2, smux1, smux0, addr );

endmodule


module RAM8x8 ( output [7:0]sai, input [7:0]data, input clk, input clear, addr, input rw );


module circuito;

reg [7:0] entrada;
reg clear;
reg endereco;
reg write;

wire clk;
wire [7:0]saida;

clock  CLK    ( clk );

RAM8x8 MEMORIA ( saida, entrada, clk, clear, endereco, write );

initial begin

entrada = 8'b00000000;
clear = 1'b1;
endereco = 1'b0;
write = 1'b0;

end

initial begin
//identificaçao
$display  ( "Exercicio05" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nMemoria 8x8\n" );
$monitor  ( "ENDEREÇO = %b     CARGA = %b     RW = %b     SAIDA = %8b  ", endereco, entrada, write, saida);

#6  clear    = 1'b0;

// ENDEREÇO = 00, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#6  endereco = 2'b00;  write = 1'b1;  entrada = 8'b11010011;

// ENDEREÇO = 01, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#12 endereco = 2'b01;  write = 1'b1;  entrada = 8'b00111101;

// ENDEREÇO = 10, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#12 endereco = 2'b10;  write = 1'b1;  entrada = 8'b10000001;

// ENDEREÇO = 11, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#12 endereco = 2'b11;  write = 1'b1;  entrada = 8'b11010000;

// ENDEREÇO = 00, WRTITE = 0, CLOCK = 1, apenas leitura de dados na memoria
#12 endereco = 2'b00;  write = 1'b0;  entrada = 8'b00000000;

// ENDEREÇO = 01, WRTITE = 0, CLOCK = 1, apenas leitura de dados na memoria
#12 endereco = 2'b01;  write = 1'b0;  entrada = 8'b00000000;

// ENDEREÇO = 10, WRTITE = 0, CLOCK = 1, apenas leitura de dados na memoria
#12 endereco = 2'b10;  write = 1'b0;  entrada = 8'b00000000;

// ENDEREÇO = 11, WRTITE = 0, CLOCK = 1, apenas leitura de dados na memoria
#12 endereco = 2'b11;  write = 1'b0;  entrada = 8'b00000000;

#6 $finish;
end
endmodule // Exercicio05 ( )