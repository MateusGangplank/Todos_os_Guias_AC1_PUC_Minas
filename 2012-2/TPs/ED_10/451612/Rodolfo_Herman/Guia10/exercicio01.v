/**
* Nome: Rodolfo Herman
* Matricula 451612
* Exercicio 01 - Guia 10
*/

module jkff ( output q, output qnot, input j, input k, input clk, input clear );
reg q, qnot;
always @( posedge clk )
begin
if ( ~clear )
begin
q <= 0; qnot <= 1;
end
else

if ( j & ~k )
begin
q <= 1; qnot <= 0;
end
else
if ( ~j & k )
begin
q <= 0; qnot <= 1;
end
else
if ( j & k )
begin
q <= ~q; qnot <= ~qnot;
end
end
endmodule // jkff

module clock ( output clk );
//criar saida
reg clk;
//valor inicial do clock
initial begin
clk = 1'b0;
end
always begin
#6 clk = ~clk;
end
endmodule

module limpar ( output sinal, input clk );
//criar saida
reg sinal;
always @ ( posedge clk ) begin
sinal = 1'b0;
#18 sinal = 1'b1;
#300 sinal = 1'b0;
end
endmodule

module carga ( output sinal, input clk );
//criar saida
reg sinal;
always  @ ( posedge clk ) begin
sinal = 1'b0;
#18 sinal = 1'b1;
#12 sinal = 1'b0;
#96 sinal = 1'b1;
#12 sinal = 1'b0;
#96 sinal = 1'b1;
#12 sinal = 1'b0;
#96 sinal = 1'b1;
end
endmodule

module cargasec ( output sinal, input clk );
//criar saida
reg sinal;
always  @ ( posedge clk ) begin
sinal = 1'b0;
#72 sinal = 1'b1;
#12 sinal = 1'b0;
#96 sinal = 1'b1;
#12 sinal = 1'b0;
#96 sinal = 1'b1;
#12 sinal = 1'b0;
#96 sinal = 1'b1;
end
endmodule



module endereco ( output sinal, input clk );
//criar saida
reg sinal;
always  @ ( posedge clk ) begin
sinal = 1'b0;
#18 sinal = 1'b1;
#12 sinal = 1'b0;
#42 sinal = 1'b1;
#12 sinal = 1'b0;
#42 sinal = 1'b1;
#12 sinal = 1'b0;
#42 sinal = 1'b1;
#12 sinal = 1'b0;
#42 sinal = 1'b1;
#12 sinal = 1'b0;
end
endmodule

module rw ( output sinal, input clk );
//criar saida
reg sinal;
always  @ ( posedge clk ) begin
sinal = 1'b0;
#18 sinal = 1'b1;
#12 sinal = 1'b0;
#42 sinal = 1'b1;
#12 sinal = 1'b0;
#42 sinal = 1'b1;
#12 sinal = 1'b0;
#42 sinal = 1'b1;
#12 sinal = 1'b0;
#42 sinal = 1'b1;
#12 sinal = 1'b0;
end
endmodule


module circuitoRam;
//criar fios
wire writread;
wire addr;
wire [3:0]load;
wire [3:0]invert;
wire clear;
wire clk;
wire [3:0]q;
wire [3:0]qnot;
wire [4:0]saidas;
//criar circuito
clock      teste1  ( clk );
limpar     teste2  ( clear, clk );
endereco   teste3  ( addr, clk );
carga      teste4  ( load[0], clk                          );
cargasec   teste5  ( load[1], clk                          );
carga      teste6  ( load[2], clk                          );
cargasec   teste7  ( load[3], clk                          );
rw         teste8  ( writread, clk );
and        teste9  ( saidas[0], clk, rw, addr );
not        teste10 ( invert[0], load[0]       );
not        teste11 ( invert[1], load[1]       );
not        teste12 ( invert[2], load[2]       );
not        teste13 ( invert[3], load[3]       );
jkff       teste14 ( q[0], qnot[0], load[0], invert[0], saidas[0], clear );
jkff       teste15 ( q[1], qnot[1], load[1], invert[1], saidas[0], clear );
jkff       teste16 ( q[2], qnot[2], load[2], invert[2], saidas[0], clear );
jkff       teste17 ( q[3], qnot[3], load[3], invert[3], saidas[0], clear );
and        teste18 ( saidas[1], q[0], addr );
and        teste19 ( saidas[2], q[1], addr );
and        teste20 ( saidas[3], q[2], addr );
and        teste21 ( saidas[4], q[3], addr );

initial begin
//identificaçao
$display  ( "Exercicio 01" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nRAM 1x4\n" );
$monitor  ( "CLEAR = %b   ENDEREÇO = %b   CARGA = %b%b%b%b   RW = %b   CLOCK = %b   SAIDA FLIP-FLOP = %b%b%b%b   SAIDA = %b%b%b%b",clear, addr, load[3], load[2], load[1], load[0], writread, clk, q[3], q[2], q[1], q[0], saidas[4], saidas[3], saidas[2], saidas[1] );
$dumpfile ( "Exercicio01.vcd" );
$dumpvars ( 1, clk, addr, load, writread, clear  );
#300 $finish;
end
endmodule // Exemplo045 ( )