// -------------------------
// Exemplo0016 - BASE 
// Nome: Wender Zacarias Xavier 
// Matricula: 427472 
// ------------------------- 
// ------------------------- 
// test number system 
// ------------------------- 
		module test_base_01; 
// ------------------------- definir dados 
		reg [4:0] a; 
		reg [4:0] b; 
		reg [3:0] c; 
		reg [3:0] d; 
		reg [3:0] e;
// ------------------------- parte principal 
	initial begin 
		$display("Exemplo0016 - Wender Zacarias Xavier - 427472"); 
		$display("Test number system"); 
			a = 2+14; // Resultado = 16 
			b = 3*7;   // Resultado = 21
			c = 34/3;  // Resultado = 11,3
			d = 19-11; // Resultado = 8
			e = 2*4+6-1; // Resultado = 13 
		$display("\nPositive value"); 
		$display("a = %d = %b", a, a); 
		$display("b = %d = %b", b, b); 
		$display("c = %d = %b", c, c); 
		$display("d = %d = %b", d, d); 
		$display("e = %d = %b", e, e); 
 
		end 
	endmodule // test_base 