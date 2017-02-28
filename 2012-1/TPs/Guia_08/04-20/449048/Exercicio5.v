//-- Miller 449049 --
//-- Guia 8 --
//-- Exercicio 5 --

`include "FFT.v"

module AG( output s, input a, input b);
assign s = a & b;
endmodule // andgate

module ParToSer;
reg clk, clr, LD, D3, D2, D1, D0, clear;
wire A, B, C, D, a, b, c, d, qnot0, qnot1, qnot2, qnot3;

AG ag0( a, D3, LD);
AG ag1( b, D2, LD);
AG ag2( c, D1, LD);
AG ag3( d, D0, LD);

FFT fft1( A, qnot0, 0, clk, a, clear);
FFT fft2( B, qnot0, A, clk, b, clear);
FFT fft3( C, qnot0, B, clk, c, clear);
FFT fft4( D, qnot0, C, clk, d, clear);

initial begin: start
clk=0; LD=0; D3=0; D2=0; D1=0; D0=0;
end

initial begin
$display("PUC MINAS - Ciencia da Computacao");
$display("Arquitetura de Computadores 1");
$display("Miller - 449048");
$display("Exercicio 4");
$display("");

$monitor("A=%b B=%b C=%b D=%b", A, B, C, D);
#1 D3=1; D2=1; D1=1; D0=1;
#1 clk=1; LD=1;
#1 clk=0; clear=1;
#1 clk=1; LD=0;
#1 clk=0; D3=1; D2=0; D1=1; D0=0;
#1 clk=1; LD=1;

end
endmodule

