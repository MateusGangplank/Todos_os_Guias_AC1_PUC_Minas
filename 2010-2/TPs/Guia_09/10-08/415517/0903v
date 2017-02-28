
// ---------------------------
// Nome: Felipe Augusto Torres
// Matricula: 415517
// ---------------------------

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
$display("Felipe Augusto - 415517");
$dumpfile ("Exercicio03.vcd"); 
$dumpvars (1, clk, p1); 
#300 $finish; 
end 

endmodule 