// ------------------------- 
// Exemplo0031 - F4 
// Nome: Bruno Cezar Andrade Viallet 
// Matricula: 396679 
// -------------------------
 
// ------------------------- 
// f4_gate 
// ------------------------- 
module f4 (output [3:0] s, output [3:0] s2, 
	input [3:0] a, 
	input [3:0] b); 
// descrever por portas 
	and and1(s[0],a[0],b[0]);
	and and2(s[1],a[1],b[1]);
	and and3(s[2],a[2],b[2]);
	and and4(s[3],a[3],b[3]);

	or or1(s2[0],a[0],b[0]);
	or or2(s2[1],a[1],b[1]);
	or or3(s2[2],a[2],b[2]);
	or or4(s2[3],a[3],b[3]);	
endmodule // f4 

module test_f4; 
// ------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	wire [3:0] z;  //--- saida AND
	wire [3:0] z2;  //--- saida OR	
	f4 modulo (z, z2, x, y); 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0031 - Bruno Cezar Andrade Viallet - 396679"); 
	$display("Test LU's module"); 
	x = 4'b0011; y = 4'b0101; 
// projetar testes do modulo 
	$display("  a    b   AND  OR");
	#1 $display("%3b %3b %3b %3b",x,y,z,z2); 
end 

endmodule // test_f4 