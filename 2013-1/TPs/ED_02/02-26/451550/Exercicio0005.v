// -------------------------
// Exercicio0005 - BASE
// Nome: Eduardo de Figueiredo Junior
// Matricula: 451550
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
     reg [7:0] a;
     reg [7:0] b;
     reg [3:0] c;
	  reg [7:0] d;
     
// ------------------------- parte principal
initial begin
      $display("Exercicio0005 - Eduardo de Figueiredo Junior - 451550");
      $display("Test number system");

      a = 43;//47 = 101011(2)
		b = 9;//9 = 1001(2)
		c = 1;
		d = 43 + (~9 + 1);
		
      $display("\nExercicio05-letra a");
		$display("r = %b + (%b + %d) = %b", a, b, c, d);

		end
endmodule // test_base

module test_base_02;
// ------------------------- definir dados
     reg [7:0] a;
     reg [7:0] b;
     reg [3:0] c;
	  reg [7:0] d;
     
// ------------------------- parte principal
initial begin
     
      a = 19;//19 = 10011(2)
		b = 13;// = 15(8)
		c = 1;
		d = 19 + (~13 + 1);
		
      $display("\nExercicio05-letra b");
		$display("r = %b + (%b + %d) = %b", a, b, c, d);

		end
endmodule // test_base

module test_base_03;
// ------------------------- definir dados
     reg [7:0] a;
     reg [7:0] b;
     reg [3:0] c;
	  reg [7:0] d;
     
// ------------------------- parte principal
initial begin
     
      a = 29;//29 = 35(8)
		b = 12;//12 = C(16)
		c = 1;
		d = 29 + (~12 + 1);
		
      $display("\nExercicio05-letra c");
		$display("r = %b + (%b + %d) = %b", a, b, c, d);

		end
endmodule // test_base

module test_base_04;
// ------------------------- definir dados
     reg [7:0] a;
     reg [7:0] b;
     reg [3:0] c;
	  reg [7:0] d;
     
// ------------------------- parte principal
initial begin
     
      a = 186;//186 = BA(16)
		b = 185;//185 = 10111001(2)
		c = 1;
		d = 186 + (~185 + 1);
		
      $display("\nExercicio05-letra d");
		$display("r = %b + (%b + %d) = %b", a, b, c, d);

		end
endmodule // test_base

module test_base_05;
// ------------------------- definir dados
     reg [7:0] a;
     reg [7:0] b;
     reg [3:0] c;
	  reg [7:0] d;
     
// ------------------------- parte principal
initial begin
     
      a = 37;
		b = 27;//27 = 1B(16)
		c = 1;
		d = 37 + (~27 + 1);
		
      $display("\nExercicio05-letra e");
		$display("r = %b + (%b + %d) = %b", a, b, c, d);

		end
endmodule // test_base
