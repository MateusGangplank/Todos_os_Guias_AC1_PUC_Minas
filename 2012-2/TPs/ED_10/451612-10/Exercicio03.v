/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Exercicio03 - GUIA10
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

module RAM1x8 ( output [7:0]sai, input [7:0]data, input clk, input clear, input addr, input rw );

wire [3:0]s1;
wire [3:0]s2;

wire [3:0]in1;
wire [3:0]in2;

assign in1 = data[3:0];
assign in2 = data[7:4];

RAM1x4 MEMORIA1 ( s1, in1, clk, clear, addr, rw );
RAM1x4 MEMORIA2 ( s2, in2, clk, clear, addr, rw );

assign sai[3:0] = s1;
assign sai[7:4] = s2;

endmodule



module circuito;

reg [7:0] entrada;
reg clear;
reg endereco;
reg write;

wire clk;
wire [7:0]saida;

clock  CLK    ( clk );

RAM1x8 MEMORIA ( saida, entrada, clk, clear, endereco, write );

initial begin

entrada = 8'b00000000;
clear = 1'b1;
endereco = 1'b0;
write = 1'b0;

end

initial begin
//identificaçao
$display  ( "Exercicio03" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nMemoria 1x8\n" );
$monitor  ( "ENDEREÇO = %b     CARGA = %b     RW = %b     CLOCK = %b     SAIDA = %8b  ", endereco, entrada, write, clk, saida);

#6  clear    = 1'b0;

// ENDEREÇO = 1, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#6 endereco = 1'b1;  write = 1'b1;  entrada = 8'b11010011;

// ENDEREÇO = 0, WRTITE = 1, CLOCK = 1, com ENDEREÇO = 0 o dado nao aparece e nao e' escrito nada na memoria
#12 endereco = 1'b0;  write = 1'b1;  entrada = 8'b00111101;

// ENDEREÇO = 1, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#12 endereco = 1'b1;  write = 1'b1;  entrada = 8'b10000001;

// ENDEREÇO = 1, WRTITE = 0, CLOCK = 1, como o WRITE = 0 nao e' permitido escrever na memoria, so ha leitura do que ja tem nela
#12 endereco = 1'b1;  write = 1'b0;  entrada = 8'b11010000;

// ENDEREÇO = 1, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#12 endereco = 1'b1;  write = 1'b1;  entrada = 8'b11110000;

// ENDEREÇO = 0, WRTITE = 1, CLOCK = 1, com ENDEREÇO = 0 o dado nao aparece e nao e' escrito nada na memoria
#12 endereco = 1'b0;  write = 1'b1;  entrada = 8'b00111101;

#6 $finish;
end
endmodule // Exercicio03 ( )