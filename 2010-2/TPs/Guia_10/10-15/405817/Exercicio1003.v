// ---------------------
// Guia 1003 - Implementar um latch D com portas NAND, 
//     PRESET e CLEAR.
//
//
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------


// --------------------- 
// modules
// ---------------------
module Dlatch (q, qbar, set, reset);
output q, qbar;
input set, reset;
wire w1,w2;
nand NAND1 (w1, set, reset);
nand NAND2 (w2, reset, ~set);
nand NAND3 (q, w1, qbar);
nand NAND4 (qbar, q, w2);
endmodule

// --------------------- 
// Exercicio1003
// ---------------------

module Exercicio1003;
wire q, qbar;
reg set,reset;

Dlatch latch1 (q, qbar, set, reset);
initial begin
$display ("Luiz Felipe Fonseca - 405817");
$monitor (" q= %b, qbar= %b, set= %b, reset= %b",q, qbar, set, reset);
set = 0; reset = 0;
#1 set = 1; reset = 1; 
#1 set = 0; 
#1 set = 1; reset = 0;
end
endmodule