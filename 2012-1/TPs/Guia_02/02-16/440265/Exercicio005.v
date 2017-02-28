// ------------------------- 
// -- Exercicio005 - BASE 
// -- Nome: Alexandre Palmieri Sad 
// -- Matricula: 440265 
// -------------------------
	module complemento2 (output [7:0]s, input [7:0]a);
		assign s = (~a) + 1;
	endmodule
	
	module soma (output [7:0]s, input [7:0]a, input [7:0]b);
		assign s = a + b;
	endmodule
	 
	module subtracao (output [7:0]s, input [7:0]a, input [7:0]b);
		wire [7:0]s1;
		complemento2 COMP1(s1, b);
		soma SOMA(s, a, s1);
	endmodule

	
// ------------------------- 
// -- test number system 
// ------------------------- 
	module test_operacoes_01; 
		// ------------------------- definir dados 
			reg [7:0]a;
			reg [7:0]b;
			reg [7:0]c;
			reg [7:0]d;
			reg [7:0]e;     
			reg [7:0]f;
			reg [7:0]g;
			reg [7:0]h;
			reg [7:0]i;
			reg [7:0]j;
			
			wire [7:0]sab;
			wire [7:0]scd;
			wire [7:0]sef;
			wire [7:0]sgh;
			wire [7:0]sij; 
			
		// ------------------------- instancia
			subtracao SUB1(sab, a, b);
			subtracao SUB2(scd, c, d);
			subtracao SUB3(sef, e, f);
			subtracao SUB4(sgh, g, h);
			subtracao SUB5(sij, i, j);
			
		// ------------------------- inicializar
			initial begin: start
				a = 8'b101010; 
				b = 4'b1101;
				c = 5'b11010;
				d = 6'o15;
				e = 6'o34;
				f = 4'hB;
				g = 8'hCA;
				h = 8'b10111001;
				i = 5'd25;
				j = 8'h1A;
			end
			
		// ------------------------- parte principal 
			initial begin 
				$display("Exercicio005 - Sad - 440265"); 
				$display("Test number system");
				#1
				$display("a) %8b - %8b = %b", a, b, sab);
				#1
				$display("b) %8b - %8o = %b", c, d, scd);
				#1
				$display("c) %8o - %8H = %b", e, f, sef);
				#1
				$display("d) %8H - %8b = %b", g, h, sgh);
				#1
				$display("e) %8d - %8h = %b", i, j, sij);
			
			end 
	endmodule //-- test_base 