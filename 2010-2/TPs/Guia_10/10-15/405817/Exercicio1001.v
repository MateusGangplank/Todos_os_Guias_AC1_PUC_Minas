// ---------------------
// Guia 1001 - Implementar um latch SR com portas NOR.
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
nor #1 (q, qbar, reset);
nor #1 (qbar, q, set);
endmodule

// --------------------- 
// Exercicio1001
// ---------------------
module Exercicio1001;
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

