// -------------------------
// Exemplo0021 – FULL ADDER 
// Nome: Ailton Gomes
// Matricula: 440092
// ------------------------- 

// -------------------------
//  Igual
// ------------------------- 
module HA (output s, 
 input [2:0] a,  
 input [2:0] b);
 wire e, f, g; 
xor XOR1(e,a[0], b[0]);
xor XOR2(f,a[1], b[1]);
xor XOR3(g,a[2], b[2]);
and and1( s, e, f, g);
endmodule //HA

module test_HA;
// ------------------------- definir dados
reg [2:0] x;
reg [2:0] y;
wire igual;
HA HA1( igual, x, y);
// ------------------------- parte principal 
 initial begin 
$display("Exemplo0021 - Ailton Gomes - 440092"); 
$display("Test ALU’s full adder"); 
$display(" Igual ");
x = 3'b001;  y = 3'b001; 
#1
$display("%3b + %3b = %b ",x,y,igual);
#1
x = 3'b011;  y = 3'b101;  
$display("%3b + %3b = %b ",x,y,igual);
#1
x = 3'b111;  y = 3'b000;  
$display("%3b + %3b = %b",x,y,igual);
 
 end 
 
endmodule // test_fullAdder