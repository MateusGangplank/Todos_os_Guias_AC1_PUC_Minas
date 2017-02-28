// ------------------------- 
// -- Exercicio003 - BASE 
// -- Nome: Alexandre Palmieri Sad 
// -- Matricula: 440265 
// ------------------------- 
	module complemento2bit7 (output [6:0]s, input [6:0]a);
		assign s = (~a) + 1;
	endmodule
	
	module complemento2bit5 (output [4:0]s, input [4:0]a);
		assign s = (~a) + 1;
	endmodule
	
	module complemento2bit6 (output [5:0]s, input [5:0]a);
		assign s = (~a) + 1;
	endmodule

	
// ------------------------- 
// -- test number system 
// ------------------------- 
	module test_operacoes_01; 
		// ------------------------- definir dados 
			reg [6:0]a;
			reg [5:0]b;
			reg [5:0]c;
			reg [6:0]d;
			reg [4:0]e;     
		
			wire [6:0]sa;
			wire [5:0]sb;
			wire [5:0]sc;
			wire [6:0]sd;
			wire [4:0]se; 
			
		// ------------------------- instancia
			complemento2bit7 COMP1(sa, a);
			complemento2bit6 COMP2(sb, b);
			complemento2bit6 COMP3(sc, c);
			complemento2bit7 COMP4(sd, d);
			complemento2bit5 COMP5(se, e);
			
			
		// ------------------------- inicializar
			initial begin: start
				a = 6'b100111; 
				b = 'o23;
				c = 23;
				d = 'h2B;
				e = -5'd10;
			end
			
		// ------------------------- parte principal 
			initial begin 
				$display("Exercicio003 - Sad - 440265"); 
				$display("Test number system");
				#1
				$display("a) complemento de: %b = %b", a, sa);
				#1
				$display("b) complemento de: %7o = %b", b, sb);
				#1
				$display("c) complemento de: %7d = %b", c, sc);
				#1
				$display("d) complemento de: %7h = %b", d, sd);
				#1
				$display("e) complemento de: %7b = %b", e, se);
			
			end 
	endmodule //-- test_base 