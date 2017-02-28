
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
#18 clk = ~clk; 
end 

endmodule 

module pulse (signal, clock); 
input clock; 
output signal; 
reg signal; 

always @ (clock) 
begin 
signal = 1'b1; 
#6 signal = 1'b0; 
#6 signal = 1'b1; 

end 

endmodule 


// --------------------- 
// Exercicio0902
// ---------------------

 
module testclock02; 
wire clk; 
clock clk1 (clk); 
wire p1; 
pulse pulse1 (p1, clk);  

initial begin 
$display("Exercicio 0902");
$display("Felipe Augusto - 415517");
$dumpfile ( "Exercicio02.vcd" ); 
$dumpvars ( 1, clk, p1 ); 
#100 $finish; 
end 

endmodule 