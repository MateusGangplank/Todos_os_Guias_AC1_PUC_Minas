// ------------------------- 
// -- Exercicio004 - BASE 
// -- Nome: Alexandre Palmieri Sad 
// -- Matricula: 440265 
// ------------------------- 
	module complemento2bit5 (output [4:0]s, input [4:0]a);
		assign s = (~a) + 1;
	endmodule
	
	module complemento2bit6 (output [5:0]s, input [5:0]a);
		assign s = (~a) + 1;
	endmodule
	
	module complemento2bit7 (output [6:0]s, input [6:0]a);
		assign s = (~a) + 1;
	endmodule
	
	module complemento2bit8 (output [7:0]s, input [7:0]a);
		assign s = (~a) + 1;
	endmodule

	
// ------------------------- 
// -- test number system 
// ------------------------- 
	module test_operacoes_01; 
		// ------------------------- definir dados 
			reg [7:0]a;
			reg [6:0]b;
			reg [5:0]c;
			reg [4:0]d;
			reg [7:0]e;     
		
			wire [7:0]sa;
			wire [6:0]sb;
			wire [5:0]sc;
			wire [4:0]sd;
			wire [7:0]se; 
			
		// ------------------------- instancia
			complemento2bit8 COMP1(sa, a);
			complemento2bit7 COMP2(sb, b);
			complemento2bit6 COMP3(sc, c);
			complemento2bit5 COMP4(sd, d);
			complemento2bit8 COMP5(se, e);
			
			
		// ------------------------- inicializar
			initial begin: start
				a = 6'b101010; 
				b = 27;
				c = 6'd23;
				d = 4'hE;
				e = 6'o26;
			end
			
		// ------------------------- parte principal 
			initial begin 
				$display("Exercicio004 - Sad - 440265"); 
				$display("Test number system");
				#1
				$display("a) complemento de: %b = %b", a, sa);
				#1
				$display("b) complemento de: %8d = %b", b, sb);
				#1
				$display("c) complemento de: %8d = %b", c, sc);
				#1
				$display("d) complemento de: %8h = %b", d, sd);
				#1
				$display("e) complemento de: %8b = %b", e, se);
			
			end 
	endmodule //-- test_base 