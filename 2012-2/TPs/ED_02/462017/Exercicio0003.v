// --------------
// Exercicio0003 - BASE
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// --------------

// --------------
// test number system
// --------------

module test_base_2;
// -------------- definir dados
    reg [4:0] a;
	 reg [3:0] b;
	 reg [2:0] c;
	 reg [4:0] d;
	 reg [3:0] e;

// -------------- parte inicial
initial begin
   $display("Exercicio0003 - Breno Macena - 462017");
	$display("Test number system");
	
	 a=~6'b100110 + 1;
	 b=~5'o24 + 1;
	 c=~5'd25 + 1;
	 d=~6'h2D + 1;
	 e=~(27-37) + 1;
	 
	 $display("\nCalculated value");
	 $display("a = C2(100110(2)) = %d = %b", a, a);
	 $display("b = C2(24(8)) = %d = %b", b, b);
	 $display("c = C2(25(10)) = %d = %b", c, c);
	 $display("d = C2(2D(16)) = %d = %b", d, d);
	 $display("e = C2((27-37)) = %d = %b", e, e);
end
endmodule // test_base