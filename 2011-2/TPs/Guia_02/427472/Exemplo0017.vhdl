// -------------------------
// Exemplo0017 - BASE 
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
		module test_base_01; 
// ------------------------- definir dados 
		reg [5:0] a; 
		reg [5:0] b;
		reg [3:0] c; 
		reg [6:0] d;
		reg [9:0] e;

// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0017 - Wender Zacarias Xavier - 427472"); 
		$display("Test number system"); 
			a = 6'b100010+5'b11010;
			b = 5'b11010 + 5'o23;
			c = 10'o1234 / 6'h2D;
			d = 9'h1A9 - 9'b101101001;
			e = 6'o25*6'o41 + 7'h6B;
			
		$display("\n Resultados \n"); 
		$display("a =  10010(2)+11010(2) = %b(2)", a); 
		$display("b = 11010(2) + 23(8) = %b(2)", b); 
		$display("c = 1234(8) / 2D(16) = %b(2)", c); 
		$display("d = 1A9(16) - 101101001(2) = %b(2)", d); 
		$display("e = 25(8)*41(8) + 6B(16) = %b(2)", e); 
 
		end 
	endmodule // test_base 