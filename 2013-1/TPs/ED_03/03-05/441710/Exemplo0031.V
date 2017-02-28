// ------------------------- 
// Exemplo0031 - F4 
// Nome: Thais Mairink 
// Matricula: 441710 
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s, input [3:0] a, input [3:0] b, input chave); 
	wire [3:0] s0; 
	wire [3:0] s1; 
	wire notchave;
	
	not(notchave, chave);
	or or1(s0[0], a[0], b[0]);
	or or2(s0[1], a[1], b[1]);
	or or3(s0[2], a[2], b[2]);
	or or4(s0[3], a[3], b[3]);

	and and1(s1[0], a[0], b[0]);
	and and2(s1[1], a[1], b[1]);
	and and3(s1[2], a[2], b[2]);
	and and4(s1[3], a[3], b[3]);

	
	assign s = chave? s0: s1; 
	
endmodule // f4 
module test_f4; 
// ------------------------- definir dados 
reg [3:0] x; 
reg [3:0] y; 
wire [3:0] z; 
reg chave;
f4 modulo (z, x, y, chave); 
// ------------------------- parte principal 
initial begin 
$display("Exemplo0031 - Thais Mairink - 441710"); 
$display("Test LU's module"); 
x = 4'b0011; y = 4'b0101; 
// projetar testes do modulo 
   #1   $monitor("%3b %3b = %3b Chave = %3b",x,y,z,chave); 
	#1	  chave = 0; 
	#1   x = 4'b0001;  y = 4'b1000; 
	#1	  chave = 1; 
	#1   x = 4'b1111;  y = 4'b1001;
	#1	  chave = 0; 
	#1   x = 4'b1011;  y = 4'b1101;
	#1	  chave = 1; 
	#1   x = 4'b1111;  y = 4'b1111;
	#1	  chave = 0; 
	#1   x = 4'b1000;  y = 4'b0000;
	#1	  chave = 1; 
	#1   x = 4'b0110;  y = 4'b1001;
	#1	  chave = 0;
end 
endmodule // test_f4 