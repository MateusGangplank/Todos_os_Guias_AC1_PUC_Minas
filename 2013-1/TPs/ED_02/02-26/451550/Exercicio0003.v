// -------------------------
// Exercicio0003 - BASE
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
     
// ------------------------- parte principal
initial begin
      $display("Exercicio0003 - Eduardo de Figueiredo Junior - 451550");
      $display("Test number system");

      a = ~42;//42 = 101010(2)
		b = 1;
		c = ~42 + 1;
		
      $display("\nExercicio03-letra a");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base

module test_base_02;
// ------------------------- definir dados
     reg [3:0] a;
     reg [3:0] b;
     reg [3:0] c;
     
// ------------------------- parte principal
initial begin
      
      a = ~21;//21 = 25(8)
		b = 1;
		c = ~21 + 1;
		
      $display("\nExercicio03-letra b");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base

module test_base_03;
// ------------------------- definir dados
     reg [2:0] a;
     reg [3:0] b;
     reg [2:0] c;
     
// ------------------------- parte principal
initial begin
      
      a = ~27;
		b = 1;
		c = ~27 + 1;
		
      $display("\nExercicio03-letra c");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base

module test_base_04;
// ------------------------- definir dados
     reg [4:0] a;
     reg [3:0] b;
     reg [4:0] c;
     
// ------------------------- parte principal
initial begin
      
      a = ~44;//44 = 2c(16)
		b = 1;
		c = ~44 + 1;
		
      $display("\nExercicio03-letra d");
		$display("r = %b + %d = %b", a, b, c);

		end
endmodule // test_base

module test_base_05;
// ------------------------- definir dados
     reg [4:0] a;
     reg [5:0] b;
     reg [3:0] c;
	  reg [3:0] d;
     
// ------------------------- parte principal
initial begin
      
      a = 25;
		b = 35;
		c = 1;
		d = ~(25-35)+1;
		
      $display("\nExercicio03-letra e");
		$display("r = (%b - %b) + %d = %b", a, b, c, d);

		end
endmodule // test_base




