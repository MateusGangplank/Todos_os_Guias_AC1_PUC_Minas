// ------------------------- 
// Exemplo0031 - F4 
// Nome: Felipe T�rres 
// Matricula: 412738
// ------------------------- 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s, output [3:0] s1,  input [3:0] a, input [3:0] b); 

		// descrever por portas
 		and AND1(s[0], a[0], b[0]);
      and AND2(s[1], a[1], b[1]);
      and AND3(s[2], a[2], b[2]);
      and AND4(s[3], a[3], b[3]);
        
      or OR1(s1[0], a[0], b[0]);
      or OR2(s1[1], a[1], b[1]);
      or OR3(s1[2], a[2], b[2]);
      or OR4(s1[3], a[3], b[3]); 

	endmodule // f4 
module test_f4; 

// ------------------------- definir dados 
 reg [3:0] x; 
 reg [3:0] y; 
 wire [3:0] z;
 wire [3:0] z1; 
 
 f4 modulo (z, z1, x, y);

// ------------------------- parte principal 
initial begin 
	//----------------------- identificar
	$display("Exemplo0031 - Felipe T�rres - 412738"); 
	$display("Test LU's module"); 
	
	x = 4'b0011; y = 4'b0101; 
	
	// projetar testes do modulo 
	#1 $monitor("%4b %4b %4b %4b",x,y,z,z1); 
end 
endmodule // test_f4 