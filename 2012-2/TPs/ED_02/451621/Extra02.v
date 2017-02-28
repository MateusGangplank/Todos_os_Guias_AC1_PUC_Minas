//Exercício Extra 02
//Nome: Vitor Angelo Lima
//Matrícula: 451621

module comp2 (output [7:0]b, input [7:0]a);
	assign b = ~a + 1;
endmodule

module teste;
	reg [7:0]a;
	wire [7:0]b;
	comp2 cm(b, a);
	
	initial begin
		$monitor("%b -> %b", a, b);
		a = 8'b0000_0000;
		#1 a = 8'b0000_0001;
		#1 a = 8'b0000_1111;
		#1 a = 8'b1111_0000;
		#1 a = 8'b1111_1111;
	end
endmodule	
