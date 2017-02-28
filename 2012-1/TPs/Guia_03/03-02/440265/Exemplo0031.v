// ---------------------------------
// -- Exemplo0031 - F4 
// -- Nome: Alexnadre Plamieir Sad 
// -- Matricula: 440265 
// ---------------------------------

// ---------------------------------
// -- f4_gate 
// ---------------------------------
module f4 (output [3:0]s, output [3:0]p, input [3:0]a, input [3:0]b); 
// -- descrever por portas 
	and i[3:0](s, a, b);
	or i[3:0](p, a, b);
endmodule // -- f4 

module test_f4; 
// --------------------------------- definir dados 
	reg [3:0] x; 
	reg [3:0] y; 
	wire [3:0] z;
	wire [3:0] w;  
	f4 modulo (z, w, x, y);
// --------------------------------- inicializacao
	initial begin:start
		x = 4'b0000; 
		y = 4'b0001;  
	end 
// --------------------------------- parte principal 
	initial begin 
		$display("Exemplo0031 - Sad - 440265"); 
		$display("Test LU's module");
		$monitor("a = %3b b = %3b and = %3b or = %3b",x,y,z,w); 
		
	// --------------------------------- projetar testes do modulo 
		#1 
		x = 4'b0000; y = 4'b0001;  
		#1 
		x = 4'b0001; y = 4'b0010;
		#1 
		x = 4'b0010; y = 4'b0011;
		#1 
		x = 4'b0011; y = 4'b0100;
		#1 
		x = 4'b0100; y = 4'b0101;
		#1 
		x = 4'b0101; y = 4'b0110;
		#1 
		x = 4'b0110; y = 4'b0111;
		#1 
		x = 4'b0111; y = 4'b1000;
		#1 
		x = 4'b1000; y = 4'b1001;
		#1 
		x = 4'b1001; y = 4'b1010;
		#1 
		x = 4'b1010; y = 4'b1011;
		#1 
		x = 4'b1011; y = 4'b1100;
		#1 
		x = 4'b1100; y = 4'b1101;
		#1 
		x = 4'b1101; y = 4'b1110;
		#1 
		x = 4'b1110; y = 4'b1111;
		#1 
		x = 4'b1111; y = 4'b0000;
	end 
endmodule // -- test_f4 