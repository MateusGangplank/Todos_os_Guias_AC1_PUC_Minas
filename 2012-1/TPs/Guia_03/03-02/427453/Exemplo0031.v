// ------------------------- 
// Exemplo0031 - F4 
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [7:0] s, 
input [3:0] a, 
input [3:0] b); 

and (s[0], a[0], b[0]);
and (s[1], a[1], b[1]);
and (s[2], a[2], b[2]);
and (s[3], a[3], b[3]);
or (s[4], a[0], b[0]);
or (s[5], a[1], b[1]);
or (s[6], a[2], b[2]);
or (s[7], a[3], b[3]);

endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [7:0] z; 
f4 modulo (z, x, y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; 
// projetar testes do modulo 
$display("x(4 bits),y(4 bits),z(8 bits or e and)"); 
#1 $display("%3b %3b %3b",x,y,z); 
end 
endmodule // test_f4 