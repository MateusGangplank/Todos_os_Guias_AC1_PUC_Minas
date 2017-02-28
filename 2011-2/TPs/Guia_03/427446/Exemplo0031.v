//----------------------------------------
// Exemplo0031 - F4
// Nome: Mateus Guilherme do Carmo Cruz
// Matrícula: 427446
//----------------------------------------

module f4(output [7:0]s, input [3:0]a, input [3:0] b);
	//descrever por portas
	
	or or1(s[0], a[0], b[0]);
	or or2(s[1], a[1], b[1]);
	or or3(s[2], a[2], b[2]);
	or or4(s[3], a[3], b[3]);
	
	and and1(s[4], a[0], b[0]);
	and and2(s[5], a[1], b[1]);
	and and3(s[6], a[2], c[2]);
	and and4(s[7], a[3], c[3]);
endmodule //f4


module testef4;
	//registradores e fios
	reg [3:0]x;
	reg [3:0]y;
	wire [7:0]z;
	
	
	
	
	initial begin
		x = 4'b0000;
		y = 4'b0000;
	end
	
	//instanciar
	f4 teste_f4(z,x,y);

	
	initial begin
		$display("Exemplo0031 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test LU's module");
		
		x = 4'b0011;
		y = 4'b0101;
		
		$monitor("x | y = %4b \t x & y = %4b", z[3:0], z[7:4]);
		
		
	end
endmodule
	