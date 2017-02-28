/**
* Nome: Rodolfo Herman
* Matricula : 451612
* Exercicio05 - GUIA08
*
*/

module dff ( output q, output qnot, input d, input clk, input preset, input clear );
reg q, qnot;
always @( posedge clk ) begin

if ( ~clear )
begin
q <= 0; qnot <= 1;
end
else

if ( ~preset )
begin
q <= 1; qnot <= 0;
end
else

begin
q <= d; qnot <= ~d;

end
end
endmodule // dff


module dat ( output sinal, input clk );
//criar saida
reg sinal;
always  @ ( posedge clk ) begin
sinal = 1'b1;
#12 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
end
endmodule

module load ( output sinal, input clk );
//criar saida
reg sinal;
always  @ ( posedge clk ) begin
sinal = 1'b1;
#12 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
end
endmodule

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
always begin
sinal = 1'b0;
#12 sinal = 1'b1;
#300 sinal = 1'b0;
end
endmodule

module set ( output sinal, input clk );
//criar saida
reg sinal;
always begin
sinal = 1'b1;
#12 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
#12 sinal = 1'b1;
#96 sinal = 1'b0;
end
endmodule

/**
*/
module regisLeft;
//registrador
reg constante;
//criar conxao
wire clk;
wire saida;
wire [4:0] q;
wire [4:0] qnot;
wire data;
wire load;
wire clear;
wire preset;
//criar circuito
clock  teste0 ( clk                                     );
dat    teste1 ( data, clk                               );
load teste10 ( load, clk );
limpar teste2 ( clear, clk                              );
set    teste3 ( preset, clk                             );
and    teste4 ( saida, data, datload                       );
dff    teste5 ( q[0], qnot[0], constante, clk, saida, clear );
dff    teste6 ( q[1], qnot[1], q[0], clk, saida, clear );
dff    teste7 ( q[2], qnot[2], q[1], clk, saida, clear );
dff    teste8 ( q[3], qnot[3], q[2], clk, saida, clear );
dff    teste9 ( q[4], qnot[4], q[3], clk, saida, clear );

initial begin
constante = 1'b0;
end

initial begin
//identificaçao
$display  ( "Exercicio 05" );
$display  ( "Autor: Rodolfo Herman - 451612" );
$display  ( "\nRegistrador de deslocamento circular para a direita\n" );
$monitor  ( "Estagio1 = %b  Estagio2 = %b  Estagio3 = %b  Estagio4 = %b  Estagio5 = %b", q[0], q[1], q[2], q[3], q[4] );
$dumpfile ( "Exercicio5.vcd" );
$dumpvars ( 1, clk, data, clear, preset );
#300 $finish;
end
endmodule // Exercicio05