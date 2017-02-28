// --------------
// Exercicio0004 - BASE
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// --------------

// --------------
// test number system
// --------------

module test_base_2;
// -------------- definir dados
    reg [7:0] a;
	 reg [6:0] b;
	 reg [5:0] c;
	 reg [4:0] d;
	 reg [7:0] e;

// -------------- parte inicial
initial begin
   $display("Exercicio0004 - Breno Macena - 462017");
	$display("Test number system");
	
	 a=~8'b101011 + 1;
	 b=~7'b111001 + 1;
	 c=~6'd27 + 1;
	 d=~5'hC + 1;
	 e=~8'o21 + 1;
	 
	$display("\nCalculated value");
	$display("a = C2(101011(2)) = %d = %b", a, a);
	$display("b = C2(321(4)) = %d = %b", b, b);
	$display("c = C2(27(10)) = %d = %b", c, c);
	$display("d = C2(C(16)) = %d = %b", d, d);
	$display("e = C2(21(8)) = %d = %b", e, e);
end
endmodule // test_base