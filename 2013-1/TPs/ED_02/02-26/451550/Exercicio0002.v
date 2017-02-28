// -------------------------
// Exercicio0002 - BASE
// Nome: Eduardo de Figueiredo Junior
// Matricula: 451550
// -------------------------
// -------------------------
//  test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
     reg [5:0] a;
     reg [4:0] b;
     reg [6:0] c;
     
// ------------------------- parte principal
initial begin
      $display("Exercicio0002 - Eduardo de Figueiredo Junior - 451550");
      $display("Test number system");

      a = 38;//38 = 100110(2)
		b = 27;//27 = 11011(2)
		c = 38 + 27;
		
      $display("\nExercicio02-letra a");
		$display("r = %b + %b = %b", a, b, c);

		end
endmodule // test_base

module test_base_02;
// ------------------------- definir dados
     reg [4:0] a;
     reg [4:0] b;
     reg [5:0] c;
     
// ------------------------- parte principal
initial begin

      a = 29;//29 = 11101(2)
		b = 21;//21 = 25(8)
		c = 29 + 21;
		
      $display("\nExercicio02-letra b");
		$display("r = %b + %o = %b", a, b, c);

		end
endmodule // test_base

module test_base_03;
// ------------------------- definir dados
     reg [9:0] a;
     reg [6:0] b;
     reg [3:0] c;
     
// ------------------------- parte principal
initial begin

      a = 668;//668 = 1234(8)
		b = 76;//76 = 4C(16)
		c = 668 / 76;
		
      $display("\nExercicio02-letra c");
		$display("r = %o + %h = %b", a, b, c);

		end
endmodule // test_base

module test_base_04;
// ------------------------- definir dados
     reg [9:0] a;
     reg [6:0] b;
     reg [6:0] c;
     
// ------------------------- parte principal
initial begin

      a = 442;//442 = 1BA(16)
		b = 371;//371 = 101110011(2)
		c = 442 - 371;
		
      $display("\nExercicio02-letra d");
		$display("r = %h - %b = %b", a, b, c);

		end
endmodule // test_base

module test_base_05;
// ------------------------- definir dados
     reg [4:0] a;
     reg [4:0] b;
     reg [9:0] c;
     
// ------------------------- parte principal
initial begin

      a = 25;
		b = 26;//26 = 32(8)
		c = 25*26;
		
      $display("\nExercicio02-letra e");
		$display("r = %d * %o = %b", a, b, c);

		end
endmodule // test_base


