
 // ------------------------- 
// Exemplo0031 - F4 
// Nome: Gustavo Jota Resende
// Matricula: 427413
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s, 
input [3:0] a, 
input [3:0] b); 
assign s = (a | b);
endmodule // f4 
module f3 (output [3:0] s2, 
input [3:0] c, 
input [3:0] d); 
 assign s1 = (c & d); 
	endmodule // f3 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [3:0] z; 
wire [3:0] k;
f4 modulo (z, x, y); 
f3 modoom (k, x, y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Gustavo Jota Resende - 427413"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; 

// projetar testes do modulo 
#1 $display("%b & %b = %b", x, y, k);
#1 $display("%b | %b = %b", x, y, z); 

end 
endmodule // test_f4 