// --------------
// Exercicio0005 - BASE
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// --------------

// --------------
// test number system
// --------------

module test_base_2;
// -------------- definir dados
    reg [7:0] a;
	 reg [7:0] b;
	 reg [7:0] c;
	 reg [7:0] d;
	 reg [7:0] e;

// -------------- parte inicial
initial begin
   $display("Exercicio0005 - Breno Macena - 462017");
	$display("Test number system");
	
	 a=8'b101010 + (~8'b1001 + 1);
	 b=8'b11011 + (~8'o15 + 1);
	 c=8'o34 + (~8'hC + 1);
	 d=8'hDA + (~8'b10111001 + 1);
	 e=8'd27 + (~8'h1B + 1);
	 
	$display("\nCalculated value");
	$display("a = 101010(2) – 1001(2) = %b", a);
	$display("b = 11011(2) – 15(8) = %b", b);
	$display("c = 34(8) – C(16) = %b", c);
	$display("d = DA(16) – 10111001(2) = %b", d);
	$display("e = 27 – 1B(16) = %b", e);
end
endmodule // test_base