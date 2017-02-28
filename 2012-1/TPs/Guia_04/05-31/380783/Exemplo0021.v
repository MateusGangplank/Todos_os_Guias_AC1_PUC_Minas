// -------------------------
// Exemplo0021 – FULL ADDER 
// Nome: Lucas Siqueira Chagas
// Matricula: 380783
// ------------------------- 

// -------------------------
//  Halth adder 
// ------------------------- 
module HA (output s, output s1,
 input a,  
 input b); 
//xor (s,a,b);
//and(s1,a,b);
//EXPERIMENTAR
xor XOR1(s,a,b);
and AND1(s1,a,b);


endmodule //HA


// -------------------------
//  full adder
// -------------------------
module FA (output s, output carry,
 input a,
 input b,
 input carryIn);
wire w1,w0,w3;

 HA h1 (w1,w0,a,b);
 HA h2 (s,w3, carryIn, w1);
// or(carry,w3,w0);
// EXPERIMENTAR
 or OR1(carry,w3,w0);


endmodule // fullAdder

module test_fullAdder;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
reg carryIn;
wire [3:0] soma;
wire  carry, carry1, carry2,carry3;

FA f1 (soma[0],carry,x[0],y[0], carryIn);
FA f2 (soma[1],carry1,x[1],y[1], carry);
FA f3 (soma[2],carry2,x[2],y[2], carry1);
FA f4 (soma[3],carry3,x[3],y[3], carry2);

 
// ------------------------- parte principal 
 initial begin 
$display("Exemplo0021 - Lucas Siqueira Chagas - 380783"); 
$display("Test ALU’s full adder"); 

x = 4'b0001;  y = 4'b0001;  carryIn = 1'b1;
#1
$display("%4b + %4b = %b Carry: %1b",x,y,soma, carryIn);
#1
x = 4'b0011;  y = 6'b0101;  carryIn = 1'b0;
$display("%6b + %6b = %b Carry: %1b",x,y,soma, carryIn);
#1
x = 4'b1111;  y = 6'b0000;  carryIn = 1'b1;
$display("%6b + %6b = %b Carry: %1b",x,y,soma, carryIn);
 
 end 
 
endmodule // test_fullAdder