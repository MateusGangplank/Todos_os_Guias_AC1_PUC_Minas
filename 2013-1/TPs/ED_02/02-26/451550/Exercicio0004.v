// -------------------------
// Exercicio0004 - BASE
// Nome: Eduardo de Figueiredo Junior
// Matricula: 451550
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
     reg [4:0] a;
     reg [3:0] b;
     reg [7:0] c;
     
// ------------------------- parte principal
initial begin
      $display("Exercicio0004 - Eduardo de Figueiredo Junior - 451550");
      $display("Test number system");

      a = ~47;//47 = 101111(2)
		b = 1;
		c = ~47 + 1;
		
      $display("\nExercicio04-letra a");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base

module test_base_02;
// ------------------------- definir dados
     reg [2:0] a;
     reg [3:0] b;
     reg [6:0] c;
     
// ------------------------- parte principal
initial begin
     
      a = ~57;//57 = 321(4)
		b = 1;
		c = ~57 + 1;
		
      $display("\nExercicio04-letra b");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base

module test_base_03;
// ------------------------- definir dados
     reg [4:0] a;
     reg [3:0] b;
     reg [5:0] c;
     
// ------------------------- parte principal
initial begin
     
      a = ~25;
		b = 1;
		c = ~25 + 1;
		
      $display("\nExercicio04-letra c");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base

module test_base_04;
// ------------------------- definir dados
     reg [3:0] a;
     reg [3:0] b;
     reg [4:0] c;
     
// ------------------------- parte principal
initial begin
     
      a = ~13;//13 = D(16)
		b = 1;
		c = ~13 + 1;
		
      $display("\nExercicio04-letra d");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base

module test_base_05;
// ------------------------- definir dados
     reg [4:0] a;
     reg [3:0] b;
     reg [7:0] c;
     
// ------------------------- parte principal
initial begin
     
      a = ~20;//20 = 24(8)
		b = 1;
		c = ~20 + 1;
		
      $display("\nExercicio04-letra e");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base



