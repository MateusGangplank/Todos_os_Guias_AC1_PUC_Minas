// ------------------------- 
// Exemplo0031 - F4 
// Nome: Rafael Lopes Barbosa
// Matricula: 435052
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [7:0] s, 
input [3:0] a, 
input [3:0] b); 

// descrever por portas
 
	assign s[7:4] = a & b;
	assign s[3:0] = a | b;

endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [7:0] z; 
f4 modulo (z, x, y); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Rafael Lopes Barbosa - 435052"); 
$display("Test LU's module");
 
x = 4'b0011; y = 4'b0101; 
// projetar testes do modulo 
#1 $display("%3b + %3b = %3b",x,y,z); 

end 
endmodule // test_f4 