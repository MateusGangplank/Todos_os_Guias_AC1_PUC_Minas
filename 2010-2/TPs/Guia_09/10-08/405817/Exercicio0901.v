// ---------------------
// Guia 0901 -Implementar um gerador de pulsos com frequ�ncia igual 
//     � metade da frequ�ncia (dobro do per�odo) do "clock".
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
#6 clk = ~clk; 
end 

endmodule 

module pulse (signal, clock); 
input clock; 
output signal; 
reg signal; 

always @ (clock) 
begin 
signal =  1'b0; 
#12 signal = 1'b1; 
#12 signal = 1'b0; 
end 

endmodule 


// --------------------- 
// Exercicio0901
// ---------------------
 
module Exercicio0901; 
wire clk; 
clock clk1 (clk); 
wire p1; 
pulse pulse1 (p1, clk);  
 

initial begin 
$display("Exercicio 0901");
$display("Luiz Felipe Fonseca - 405817");
$dumpfile ( "Exercicio01.vcd" ); 
$dumpvars ( 1, clk, p1 ); 
#100 $finish; 
end 

endmodule 