// ---------------------
// Guia 1002 - Implementar um latch SR com portas NAND, 
//     PRESET e CLEAR.
//
//
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------


// --------------------- 
// modules
// ---------------------
module SRlatch (q, qbar, set, reset);
output q, qbar;
input set, reset;
nand #1 (q, qbar, reset);
nand #1 (qbar, q, set);
endmodule
// --------------------- 
// Exercicio1002
// ---------------------

module Exercicio1002;
wire q, qbar;
reg set,reset;

SRlatch latch1 (q, qbar, set, reset);
initial begin
$display ("Luiz Felipe Fonseca - 405817");
$monitor (" q= %b, qbar= %b, set= %b, reset= %b",q, qbar, set, reset);
set = 0; reset = 0;
#1 set = 1; reset = 1; 
#1 set = 0; 
#1 set = 1; reset = 0;
end
endmodule
