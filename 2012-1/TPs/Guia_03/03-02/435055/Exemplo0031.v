// ------------------------- 
// Exemplo0031 - F4
// Nome: Samuel Eusébio da Silva 
// Matricula: 435055
	
	// ------------------------- 
	// f4_gate 
	// ------------------------- 
	
	module f4 (output [3:0] sa, output [3:0] sb, input [3:0] a, input [3:0] b); 
	// descrever por portas
	and AND1(sa[0], a[0], b[0]);
	and AND2(sa[1], a[1], b[1]);
	and AND3(sa[2], a[2], b[2]);
	and AND4(sa[3], a[3], b[3]);
	
	or OR1(sb[0], a[0], b[0]);
	or OR2(sb[1], a[1], b[1]);
	or OR3(sb[2], a[2], b[2]);
	or OR4(sb[3], a[3], b[3]);
	
	endmodule // f4
	
	module test_f4; 
	// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	wire [3:0] z1; 
	wire [3:0] z2; 
	f4 modulo (z1, z2, x, y); 
	
	// ------------------------- parte principal 
	initial begin 
	$display("Exemplo0031 - Samuel Eusébio da Silva - 435055"); 
	$display("Test LU's module"); 
	x = 4'b0011; y = 4'b0101; 
	// projetar testes do modulo 
	$monitor("%4b %4b = AND - %4b , OR - %4b",x,y,z1,z2);
	#1 x = 4'b0000; y = 4'b0000;
	#1 x = 4'b0110; y = 4'b1001;
	#1 x = 4'b0000; y = 4'b1111;
	#1 x = 4'b1111; y = 4'b1111;
	end 
	endmodule // test_f4