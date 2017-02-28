// ---------------------
// Guia 10 - Exercicio 01
// Nome: Bruno César Lopes Silva
// Matricula: 415985
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
// Guia 10 - Exe 01
// ---------------------
module Exe01;
wire q, qbar;
reg set,reset;

SRlatch latch1 (q, qbar, set, reset);
initial begin
$display ("Bruno Cesar Lopes Silva - 415985");
$monitor (" q= %b, qbar= %b, set= %b, reset= %b",q, qbar, set, reset);
set = 0; reset = 0;
#1 set = 1; reset = 1; 
#1 set = 0; 
#1 set = 1; reset = 0;
end
endmodule

