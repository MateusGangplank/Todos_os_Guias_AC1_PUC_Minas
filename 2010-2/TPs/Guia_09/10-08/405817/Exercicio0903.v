// ---------------------
// Guia 0903 - Implementar um gerador de pulsos sincronizado apenas 
//     com as variações (de subida e de descida) de "clock" e
//     duração de 4 unidades de tempo.
//
//
// Nome: Luiz Felipe Fonseca
// Matricula: 405817
// ---------------------

// --------------------- 
// modules
// ---------------------

module clock (clk); 
output clk; 
reg clk;
 
initial 
begin 
clk = 1'b0; 
end 

always 
begin 
#4 clk = ~clk; 
end 

endmodule 
module pulse (signal, clock); 
input clock; 
output signal; 
reg signal; 

always @ (posedge clock) 
begin 
signal = 1'b0; 
#64 signal = 1'b1;
#64 signal = 1'b0;

end 

endmodule 

// --------------------- 
// Exercicio0903
// ---------------------

module testclock03; 
wire clk; 
clock clk1 (clk); 
wire p1; 
pulse pulse1 (p1, clk); 

initial begin 
$display("Exercicio 0903");
$display("Luiz Felipe Fonseca - 405817");
$dumpfile ("Exercicio03.vcd"); 
$dumpvars (1, clk, p1); 
#300 $finish; 
end 

endmodule 