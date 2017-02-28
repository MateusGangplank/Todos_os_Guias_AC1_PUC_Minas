// ------------------------- 
// Exemplo0023 - Comparator
// Nome: Pedro Henrique Vilar Locatelli 
// Matricula: 427453 
// ------------------------- 
// ------------------------- 

module compa (output s,
input [3:0] a, 
input [3:0] b); 

wire p1,p2,p3,p4,p5,p6;

xor xor1 (p1, a[0], b[0]);
xor xor2 (p2, a[1], b[1]);
xor xor3 (p3, a[2], b[2]);
xor xor4 (p4, a[3], b[3]);
or or1 (p5, p1, p2);
or or2 (p6, p3, p4);
nor or3 (s, p5, p6);
 
endmodule // 
module test_compa; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire s; 
compa s1 (s, x, y);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0023 - Pedro Henrique Vilar Locatelli - 427453"); 
$display("Test ALU's comparator"); 
x = 3'b110; y = 3'b111;
#1 $display("%3b + %3b = %4b", x, y, s);  
x = 3'b111; y = 3'b111;
#1 $display("%3b + %3b = %4b", x, y, s);  
end 
endmodule