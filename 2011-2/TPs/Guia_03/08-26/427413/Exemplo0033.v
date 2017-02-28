
 // ------------------------- 
// Exemplo0033 - F4 
// Nome: Gustavo Jota Resende
// Matricula: 427413
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f5 (output [3:0] s3, 
input [3:0] a, 
input [3:0] b,
input [3:0] c);
assign s3 = (b & ~c) | (a & c); 
	endmodule // f5	
module f4 (output [3:0] s, 
input [3:0] a, 
input [3:0] b);
assign s = ~(a | b);
endmodule // f4 

module f3 (output [3:0] s2, 
input [3:0] a, 
input [3:0] b); 
 assign s1 = ~(a & b); 
	endmodule // f3 
	
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg [3:0] chave;
wire [3:0] z; 
wire [3:0] k;
wire [3:0] l;
f4 modulo (z, x, y); 
f3 modulo2 (k, x, y); 
f5 modulo3 (l, z, k, chave);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0033 - Gustavo Jota Resende - 427413"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; 
#1 chave = 4'b1111;
$monitor("%b (& ou |) %b com chave %b = %b", y, x, chave, l ); 


	
	


end 
endmodule // test_f4 

//Testes
// 0000 (& ou |) 0001 com chave 1111 = 1000