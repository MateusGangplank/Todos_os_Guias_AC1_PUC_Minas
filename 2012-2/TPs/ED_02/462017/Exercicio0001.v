// --------------
// Exercicio0001 - BASE
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// --------------

// --------------
// test number system
// --------------

module test_base_2;
// -------------- definir dados
    reg [4:0] a;
	 reg [4:0] b;
	 reg [2:0] c;
	 reg [3:0] d;
	 reg [4:0] e;

// -------------- parte inicial
initial begin
   $display("Exercicio0001 - Breno Macena - 462017");
	$display("Test number system");
	
	 a=2+14;
	 b=3*9;
	 c=32/5;
	 d=24-11;
	 e=2*6+7-1;
	 
	 $display("\nCalculated value");
	 $display("a = 2+14 = %b", a);
	 $display("b = 3*9 = %b", b);
	 $display("c = 32/5 = %b", c);
	 $display("d = 24-11 = %b", d);
	 $display("e = 2*6+7-1 = %b", e);
end
endmodule // test_base