// ------------------------- 
// Exemplo0052
// Nome: Gustavo Jota Resende
// Matricula: 427413
// -------------------------

 // -------------- 
// --- Mealy FSM 
// -------------- 
/* 
	Mealy FSM Diagram 
__________________ 
/ \ 
1 v 1 0 1 | // found 
[start] ---> [id1] ---> [id11] ---> [id110] 
^ \0 0 | 1 / ^ 0 | // not found 
\_/ / \__/ | 
\_______/ / 
\ / 
\______________________/ 
*/ 
// constant definitions 
`define found 1 
`define notfound 0 
// FSM by Mealy 




 // -------------- 
// --- Mealy 101 
// -------------- 
module mealy101 ( y, x, clk, reset ); 
output y; 
input x; 
input clk; 
input reset; 
reg y; 
parameter // state identifiers 
start = 2'b00, 
id1 = 2'b01, 
id10 = 2'b10, 
id110 = 2'b10; 
reg [1:0] E1; // current state variables 
reg [1:0] E2; // next state logic output 
// next state logic 
always @( x or E1 ) 
begin 
y = `notfound; 
case ( E1 ) 
start: 
if ( x ) 
E2 = id1; 
else 
E2 = start; 
id1: 
if ( x ) 
E2 = id10; 
else 
E2 = start; 
id10: 
if ( x ) 
E2 = id10; 
else 
E2 = id10; 
id10: 
if ( x ) 
begin 
E2 = id1; 
y = `found; 
end 
else 
begin 
E2 = start; 
y = `notfound; 
end 
default: // undefined state 
E2 = 2'bxx; 
endcase 
end // always at signal or state changing 
// state variables 
always @( posedge clk or negedge reset ) 
begin 
if ( reset ) 
E1 = E2; // updates current state 
else 
E1 = 0; // reset 
end // always at signal changing 
endmodule // mealy101 

// -------------------- 
// --- Test
// -------------------- 
//  
module Exemplo0052; 
reg clk, reset, x; 
wire m1, m2; 
mealy101 mealy1 ( m1, x, clk, reset ); 
initial 
begin 
$display ( "Time X Mealy 101" ); 
// initial values 
clk = 1; 
reset = 0; 
x = 0; 
// input signal changing 
#5 reset = 1; 
#10 x = 1; 
#10 x = 0; 
#10 x = 1; 
#20 x = 0; 
#10 x = 1; 
#10 x = 1; 
#10 x = 0; 
#10 x = 1; 
#30 $finish; 
end // initial 
always 
#5 clk = ~clk; 
always @( posedge clk ) 
begin 
$display ( "%4d %4b %4b %5b", $time, x, m1, m2 ); 
end // always at positive edge clocking changing 
endmodule // Exemplo0052

//--Teste
//  --Time X Mealye
//	 -- 10    0    0     z
//	 -- 20    1    0     z
//  -- 30    0    0     z
// --  40    1    0     z
// --  50    1    0     z
// --  60    0    0     z
// --  70    1    0     z
// --  80    1    0     z
// --  90    0    0     z
// --  100   0    0     z
// --  110   1    0     z
// --  120      1    0     z