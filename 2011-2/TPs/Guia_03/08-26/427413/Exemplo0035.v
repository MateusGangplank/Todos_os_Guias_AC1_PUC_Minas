
 // ------------------------- 
// Exemplo0034 - F4 
// Nome: Gustavo Jota Resende
// Matricula: 427413
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f5 (output [3:0] s3, 
input [3:0] a, 
input [3:0] b );
assign s3 = (a & b); 
	endmodule // f5	
module f4 (output [3:0] s, 
input [3:0] a, 
input [3:0] b);
assign s = (a ^ b);
endmodule // f4 

module f3 (output [3:0] s2, 
input [3:0] a, 
input [3:0] b); 
 assign s1 = ~(a ^ b); 
	endmodule // f3 
	
	module f6 (output [3:0] s3, 
input [3:0] a, 
input [3:0] b );
assign s3 = ~(a & b); 
	endmodule // f6
	
	module f7 (output [3:0] s3, 
input [3:0] a, 
input [3:0] b );
assign s3 = ~(a | b); 
	endmodule // f7
	
	module f8 (output [3:0] s3, 
input [3:0] a, 
input [3:0] b );
assign s3 = (a | b); 
	endmodule // f8
	
	module f9 (output [3:0] s3, 
input [3:0] a );
assign s3 = ~(a); 
	endmodule // f9
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
reg [3:0] chave;
wire [3:0] z; 
wire [3:0] k;
wire [3:0] l;
wire [3:0] m;
wire [3:0] n;
wire [3:0] o;
wire [3:0] p;
f4 modulo (z, x, y); 
f3 modulo2 (k, x, y); 
f5 modulo3 (l, z, k);
f6 modulo4 (m, x, y);
f7 modulo5 (n, x, y);
f8 modulo6 (o, x, y);
f9 modulo7 (p, x);
// ------------------------- parte principal 
initial begin 
$display("Exemplo0034 - Gustavo Jota Resende - 427413"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; 

// projetar testes do modulo 
#1 $display(" XNOR %b & %b = %b", x, y, k);
#1 $display(" XOR %b | %b = %b", x, y, z); 
#1 $display(" AND %b | %b = %b", x, y, l); 
#1 $display(" NAND %b | %b = %b", x, y, m); 
#1 $display(" NOR %b | %b = %b", x, y, n);
#1 $display(" OR %b | %b = %b", x, y, o);
#1 $display(" NOT %b | %b = %b", x, p); 



	
	


end 
endmodule // test_f4 

//Testes
//Theldo, não entendi os erro ocorridos na execução
//Testes:
//  0011 & 0101 = zzzz
// 0011 | 0101 = 0110
// 0011 | 0101 = 0xx0
// 0011 | 0101 = 1110
// 0011 | 0101 = 1000
// 0011 | 0101 = 0111
// 0011 | 1100 = ?