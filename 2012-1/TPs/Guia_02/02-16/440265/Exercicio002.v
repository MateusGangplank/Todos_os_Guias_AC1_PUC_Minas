// ------------------------- 
// -- Exercicio002 - BASE 
// -- Nome: Alexandre Palmieri Sad 
// -- Matricula: 440265 
// ------------------------- 
	module letraA (output [6:0]s, input [5:0]a, input [4:0]b);
		assign s = a + b;
	endmodule
	
	module letraB (output [5:0]s, input [4:0]a, input [4:0]b);
		assign s = a + b;
	endmodule
	
	module letraC (output [10:0]s, input [10:0]a, input [7:0]b);
		assign s = a / b;
	endmodule
	
	module letraD (output [8:0]s, input [8:0]a, input [8:0]b);
		assign s = a - b;
	endmodule
	
	module letraE (output [9:0]s, input [4:0]a, input [4:0]b, input [6:0]c);
		assign s = ((a * b) + (c));
	endmodule

// ------------------------- 
// -- test number system 
// ------------------------- 
	module test_operacoes_01; 
		// ------------------------- definir dados 
			reg [5:0]a; 
			reg [4:0]b; 
			
			reg [4:0]c; 
			reg [4:0]d;
			
			reg [10:0]e; 
			reg [7:0]f; 
			
			reg [8:0]g; 
			reg [8:0]h; 
			
			reg [4:0]i; 
			reg [4:0]j; 
			reg [6:0]k;   
		
			wire [6:0]s1; 
			wire [5:0]s2; 
			wire [10:0]s3; 
			wire [8:0]s4; 
			wire [9:0]s5; 
			
		// ------------------------- instancia
			letraA soma(s1, a, b); 
			letraB mult(s2, c, d);
			letraC divs(s3, e, f);
			letraD subt(s4, g, h);
			letraE expr(s5, i, j, k);
			
		// ------------------------- parte principal 
			initial begin 
				$display("Exercicio002 - Sad - 440265"); 
				$display("Test number system");
				
				a = 7'b101010;
				b = 5'b11010; 
				$display("a) %b + %b = %b", a, b, s1);
				
				c = 5'b11010;
				d = 'o25;
				$display("b) %b + %o = %b", c, d, s2);
				
				e = 'o1234;
				f = 'h2B;
				$display("c) %o / %h = %b", e, f, s3);
				
				g = 'h1CA;
				h = 9'b101110001;
				$display("d) %h - %b = %b", g, h, s4);
				
				i = 25;
				j = 'o31;
				k = 'h7A;
				$display("e) %d * %o + (%h) = %b", i, j, k, s5);
			
			end 
	endmodule //-- test_base 