/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Exercicio01 - GUIA10
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

module circuito;

reg [3:0] entrada;
reg clear;
reg endereco;
reg write;

wire clk;
wire [3:0]saida;

clock  CLK    ( clk );

RAM1x4 MEMORIA ( saida, entrada, clk, clear, endereco, write );

initial begin

entrada = 4'b0000;
clear = 1'b1;
endereco = 1'b0;
write = 1'b0;

end

initial begin
//identificaçao
$display  ( "Exercicio01" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nMemoria 1x4\n" );
$monitor  ( "ENDEREÇO = %b   CARGA = %b   RW = %b   CLOCK = %b   SAIDA = %b  ", endereco, entrada, write, clk, saida);
#6  clear    = 1'b0;

// ENDEREÇO = 1, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#6 endereco = 1'b1;  write = 1'b1;  entrada = 4'b0011;

// ENDEREÇO = 0, WRTITE = 1, CLOCK = 1, com ENDEREÇO = 0 o dado nao aparece e nao e' escrito nada na memoria
#12 endereco = 1'b0;  write = 1'b1;  entrada = 4'b0001;

// ENDEREÇO = 1, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#12 endereco = 1'b1;  write = 1'b1;  entrada = 4'b1001;

// ENDEREÇO = 1, WRTITE = 0, CLOCK = 1, como o WRITE = 0 nao e' permitido escrever na memoria, so ha leitura do que ja tem nela
#12 endereco = 1'b1;  write = 1'b0;  entrada = 4'b1101;

// ENDEREÇO = 1, WRTITE = 1, CLOCK = 1, os dados sao escritos na memoria
#12 endereco = 1'b1;  write = 1'b1;  entrada = 4'b1111;

#6 $finish;
end
endmodule // Exercicio01 ( )