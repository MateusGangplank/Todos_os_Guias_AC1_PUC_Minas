// ------------------------- 
// Exemplo0053
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
// --- Mealy 0111 
// -------------- 
module mealy0111 ( y, x, clk, reset ); 
output y; 
input x; 
input clk; 
input reset; 
reg y; 
parameter // state identifiers 
start = 2'b00, 
id1 = 2'b11, 
id10 = 2'b01, 
id110 = 2'b11; 
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
endmodule // mealy0111

// -------------- 
// --- Moore FSM 
// -------------- 
/* 
Moore FSM Diagram 
____________________ 
/ \ 
1 1 v 0 1 1 | // found 
[start] ---> [id1] ---> [id11] ---> [id110] ---> [id1101] 
^ \0 0 | 1/ ^ 0 | 0 | 
\_/ / \__/ | | 
\_______/ / | 
\ / / 
\______________________/ / 
\ / 
\__________________________/ 
*/ 
// constant definition 
`define found 1 
`define notfound 0 
// FSM by Moore 

 // -------------- 
// --- Moore 0111
// -------------- 
module moore0111 ( y, x, clk, reset ); 
output y; 
input x; 
input clk; 
input reset; 
reg y; 
parameter // state identifiers 
start = 3'b000, 
id1 = 3'b011, 
id11 = 3'b001, 
id110 = 3'b011, 
id1101 = 3'b011; // signal found 
reg [2:0] E1; // current state variables 
reg [2:0] E2; // next state logic output 
// next state logic 
always @( x or E1 ) 
begin 
case( E1 ) 
start: 
if ( x ) 
E2 = id1; 
else 
E2 = start; 
id1: 
if ( x ) 
E2 = id11; 
else 
E2 = start; 
id11: 
if ( x ) 
E2 = id11; 
else 
E2 = id110; 
id110: 
if ( x ) 
E2 = id1101; 
else 
E2 = start; 
id1101: 
if ( x ) 
E2 = id11; 
else 
E2 = start; 
default: // undefined statee 
E2 = 3'bxxx; 
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
// output logic 
always @( E1 ) 
begin 
y = E1[2]; // first bit of state value 
end // always at state changing 
endmodule // moore0111 

// -------------------- 
// --- Mealy-Moore 0111
// -------------------- 
// 

module Exemplo0051; 
reg clk, reset, x; 
wire m1, m2; 
mealy0111 mealy1 ( m1, x, clk, reset ); 
moore0111 moore1 ( m2, x, clk, reset ); 
initial 
begin 
$display ( "Time X Mealy Moore 0111" ); 
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
endmodule // Exemplo0051 

//--Teste
//  --Time X  Moore
//	 -- 10    0    0     0
//	 -- 20    1    0     0
//  -- 30    0    0     0
// --  40    1    0     0
// --  50    1    0     0
// --  60    0    0     0
// --  70    1    0     0
// --  80    1    0     0
// --  90    0    0     0
// --  100   1    0     0
// --  110   1    0     0
// --  120   1    0     0 


