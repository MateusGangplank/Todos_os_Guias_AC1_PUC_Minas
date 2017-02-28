//
// Exemplo0031 - F4 
// Nome: Pedro Henrique Hardeman Guedes
// Matricula: 397260
//

//
// f4_gate
//
module f4 (output [3:0] s, output [3:0] s1, input [3:0] a, input [3:0] b);
	// descrever por portas
	and and1(s[0],a[0],b[0]);
	and and2(s[1],a[1],b[1]);
	and and3(s[2],a[2],b[2]);
	and and4(s[3],a[3],b[3]);
	
	or or1(s1[0],a[0],b[0]);
	or or2(s1[1],a[1],b[1]);
	or or3(s1[2],a[2],b[2]);
	or or4(s1[3],a[3],b[3]);
endmodule // f4 

module test_f4;
	// definir dados
	reg [3:0] x;
	reg [3:0] y;
	wire [3:0] w;
	wire [3:0] z;
	
	f4 modulo (w, z, x, y);
	
	// parte principal 
	initial begin
		$display("Exemplo0031 - Pedro Henrique Hardeman Guedes - 397260");
		$display("Test LU's module");
	
	x = 4'b0011; y = 4'b0101;
	
	// projetar testes do modulo
	$display("x \ty \tAND \tOR");
	#1 $display("%3b \t%3b \t%3b \t%3b", x, y, w, z);
	end
endmodule // test_f4