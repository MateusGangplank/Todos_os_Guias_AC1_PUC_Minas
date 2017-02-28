// -------------------------
// Exemplo0021 – FULL ADDER 
// Nome: Ailton Gomes
// Matricula: 440092
// ------------------------- 

// -------------------------
//  Meia Soma 
// ------------------------- 
module HA (output s, output s1,
 input a,  
 input b); 
xor XOR1(s,a,b);
and AND1(s1,a,b);
endmodule //HA
// -------------------------
// FULL ADDER
// -------------------------
 module FU (output [3:0]soma,
 input[2:0]a);
 wire aux1, aux2;

HA Ha1 (soma[0], aux1, a[0], 1);
HA Ha2 (soma[1], aux2, a[1], aux1);
HA Ha3 (soma[2], soma[3], a[2], aux2);

endmodule //FULL ADDER

module test_fullAdder;
// ------------------------- definir dados
reg [2:0] x;
wire [3:0] soma;
FU f1( soma, x);
// ------------------------- parte principal 
 initial begin 
$display("Exemplo0021 - Ailton Gomes - 440092"); 
$display("Test ALU’s full adder"); 
$display(" Complemento de 2 ");
x = 3'b001;   
#1
$display("%3b = %4b ",x,soma);
#1
x = 3'b011;    
$display("%3b = %4b ",x,soma);
#1
x = 3'b111;    
$display("%3b = 4b",x,soma);
 
 end 
 
endmodule // test_fullAdder