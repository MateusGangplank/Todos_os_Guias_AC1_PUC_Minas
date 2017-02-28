// -------------------------
// Exemplo0022 – FULL ADDER 
// Nome: Ailton Gomes
// Matricula: 440092
// ------------------------- 

// -------------------------
//  Meia Diferença
// ------------------------- 
module HA (output s, output s1,
 input a,  
 input b); 
xor XOR1( s, a, b);
and AND1( s1, ~a, b);
endmodule //HA

// -------------------------
//  Subitrator
// -------------------------
 module HB (output s, output s1,
 input a,
 input b,
 input c);
 wire w1, w0, w2;

 HA h1 (w1, w0, a, b);
 HA h2 (s, w2, c, w0);
 or AND2(s1, w0, w2);
 
endmodule //soma


// -------------------------
// FULL ADDER
// -------------------------
 module FU (output [3:0]soma,
 input [2:0] a,
 input [2:0] b);
 wire aux1, aux2;

HA Ha1 (soma[0], aux1, a[0], b[0]);
HB Hb2 (soma[1], aux2, a[1], b[1], aux1);
HB Hb3 (soma[2], soma[3], a[2], b[2], aux2);


endmodule //FULL ADDER

module test_fullAdder;
// ------------------------- definir dados
reg [2:0] x;
reg [2:0] y;
wire [3:0] soma;
FU f1( soma, x, y);
// ------------------------- parte principal 
 initial begin 
$display("Exemplo0022 - Ailton Gomes - 440092"); 
$display("Test ALU’s full adder"); 
$display(" Subtrator ");
x = 3'b001;  y = 3'b001; 
#1
$display("%3b - %3b = %4b ",x,y,soma);
#1
x = 3'b011;  y = 3'b101;  
$display("%3b - %3b = %4b ",x,y,soma);
#1
x = 3'b111;  y = 3'b000;  
$display("%3b - %3b = %4b ",x,y,soma);
 
 end 
 
endmodule // test_fullAdder