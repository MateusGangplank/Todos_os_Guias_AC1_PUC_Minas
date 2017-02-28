// -------------------------
// Exercicio0001 - BASE
// Nome: Eduardo de Figueiredo Junior
// Matricula: 451550
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
     reg [5:0] a;
     reg [3:0] b;
     reg [4:0] c;
     reg [4:0] d;
// ------------------------- parte principal
initial begin
      $display("Exercicio0001 - Eduardo de Figueiredo Junior - 451550");
      $display("Test number system");

		a = 3;
		b = 14;
		c = 3 + 14;
		$display("\nExercicio01-letra a");
		$display("r = %d + %d = %b", a, b, c);
		
		a = 3;
		b = 8;
		c = (3*8);
		$display("\nExercicio01-letra b");
		$display("r = %d * %d = %b", a, b, c);
		end
endmodule // test_base

module test_base_02;
// ------------------------- definir dados
     reg [5:0] a;
     reg [3:0] b;
     reg [2:0] c;
     reg [4:0] d;
// ------------------------- parte principal
initial begin

		
		a = 33;
		b = 5;
		c = 33 / 5;
		$display("\nExercicio01-letra c");
		$display("r = %d / %d = %b", a, b, c);
	
end
endmodule // test_base

module test_base_03;
// ------------------------- definir dados
     reg [4:0] a;
     reg [3:0] b;
     reg [3:0] c;
     reg [4:0] d;
// ------------------------- parte principal
initial begin

		
		a = 25;
		b = 11;
		c = 25-11;
		$display("\nExercicio01-letra d");
		$display("r = %d - %d = %b", a, b, c);
	
end
endmodule // test_base

module test_base_04;
// ------------------------- definir dados
     reg [2:0] a;
     reg [3:0] b;
     reg [4:0] c;
     reg [4:0] d;
	  reg [4:0] e;
// ------------------------- parte principal
initial begin

		a = 2;
		b = 8;
		c = 7;
		d = 1;
		e = 2*8 + 7 - 1;
		$display("\nExercicio01-letra e");
		$display("r = %d * %d + %d - %d = %b", a, b, c, d, e);
	
end
endmodule // test_base