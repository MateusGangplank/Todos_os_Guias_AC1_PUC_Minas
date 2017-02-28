// -- Arquitetura de Computadores I
// -- Guia 10
// -- Nome: Luhan Mairinck Reis 
// -- Matricula: 446987

`include "JKFF.v"

module RAM (output s, input address, input rw, 
               input clk, input x, input clr);
					
wire s, q, qnot, notX;

and AND1 (s, address, rw, clk);
not NOT1 (notX, x);
jkff jkff1 (q, qnot, x, notX, s, clr);
and AND2 (s, address, q);

endmodule // RAM

module test_RAM1x4;

wire [3:0] s;
reg clk, clr, rw, address;
reg [3:0] x;

RAM R0 (s[0],address,rw,clk,x[0],clr);
RAM R1 (s[1],address,rw,clk,x[1],clr);
RAM R2 (s[2],address,rw,clk,x[2],clr);
RAM R3 (s[3],address,rw,clk,x[3],clr);


initial
begin 

$display ( " Time x s "); 
clk = 0; 
x = 0; rw = 1; clr = 1;

// input signal changing 

#2 x = 1001; address = 1;clr = 0;
#2 x = 0; address = 1; 
#2 address = 1; 
#2 $finish; 
end // initial 

always
#1 clk = ~clk;

always @( posedge clk ) 
begin 
$display ( "%2d %2b %4b", $time, x, s);
 
end // always at positive edge clocking changing 
endmodule //module test