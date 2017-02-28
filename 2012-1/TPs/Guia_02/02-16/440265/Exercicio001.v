// ------------------------- 
// -- Exemplo0015 - BASE 
// -- Nome: Alexandre Palmieri Sad 
// -- Matricula: 440265 
// ------------------------- 
	module letraA (output [4:0]s, input [1:0]a, input [4:0]b);
		assign s = a + b;
	endmodule
	
	module letraB (output [4:0]s, input [1:0]a, input [3:0]b);
		assign s = a * b;
	endmodule
	
	module letraC (output [5:0]s, input [5:0]a, input [1:0]b);
		assign s = a / b;
	endmodule
	
	module letraD (output [4:0]s, input [4:0]a, input [3:0]b);
		assign s = a - b;
	endmodule
	
	module letraE (output [3:0]s, input [1:0]a, input [2:0]b, input [2:0]c, input d);
		assign s = ((a * b) + (c - d));
	endmodule

// ------------------------- 
// -- test number system 
// ------------------------- 
	module test_operacoes_01; 
		// ------------------------- definir dados 
			reg [1:0]a; 
			reg [4:0]b; 
			reg [1:0]c; 
			reg [3:0]d;
			reg [5:0]e; 
			reg [1:0]f; 
			reg [4:0]g; 
			reg [3:0]h; 
			reg [1:0]i; 
			reg [2:0]j; 
			reg [2:0]k; 
			reg l;  
		
			wire [4:0]s1; 
			wire [4:0]s2; 
			wire [5:0]s3; 
			wire [4:0]s4; 
			wire [3:0]s5; 
			
		// ------------------------- instancia
			letraA soma(s1, a, b); 
			letraB mult(s2, c, d);
			letraC divs(s3, e, f);
			letraD subt(s4, g, h);
			letraE expr(s5, i, j, k, l);
			
		// ------------------------- parte principal 
			initial begin 
				$display("Exercicioo001 - Sad - 440265"); 
				$display("Test number system");
				
				a = 2;
				b = 15; 
				$display("a) %b + %b = %b", a, b, s1);
				
				c = 3;
				d = 8;
				$display("b) %b * %b = %b", c, d, s2);
				
				e = 32;
				f = 3;
				$display("c) %b / %b = %b", e, f, s3);
				
				g = 21;
				h = 11;
				$display("d) %b - %b = %b", g, h, s4);
				
				i = 2;
				j = 5;
				k = 6;
				l = 1;
				$display("e) %b * %b + (%b - %b) = %5b", i, j, k, l, s5);
			
			end 
	endmodule //-- test_base 