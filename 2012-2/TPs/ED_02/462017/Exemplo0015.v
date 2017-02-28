// --------------
// Exemplo0011 - BASE
// Nome: Breno Macena Pereira de Souza
// Matricula: 462017
// --------------

// --------------
// test number system
// --------------

module test_base_01;
// -------------- definir dados
   reg [2:0] a;
	reg [3:0] b;
	reg [4:0] c;
	reg [4:0] d;
	
// -------------- parte inicial
initial begin
   $display("Exemplo0011 - Breno Macena - 462017");
	$display("Test number system");
	
	 a=5;
	 b=10;
	 c=15;
	 d=20;
	 
	$display("\nPositive value");
	$display("a = %d = %3b", a, a);
	$display("a = %d = %4b", a, a);
	$display("a = %d = %5b", a, a);
	
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	$display("d = %d = %5b", d, d);
	$display("d = %d = %5o", d, d);
	$display("d = %d = %5h", d, d);
	
// ---------------- números negativos (C2)
	 a=-5;
	 b=-5;
	 c=-5;
	 
	$display("\nNegative value");
	$display("a = -5[3] = %d = %3b", a, a);
	$display("b = -5[4] = %d = %4b", b, b);
	$display("a = -5[5] = %d = %5b", c, c);

// ---------------- números negativos expressão mista (C1 + 1)
	 a=~5+1;
	 b=~5+1;
	 c=~5+1;
	 
	$display("\nNegative mixed expression");
	$display("a = %d = %3b", a, a);
	$display("b = %d = %4b", b, b);
	$display("c = %d = %5b", c, c);
	
// ----------------- overflow
	 a=5+3;
	 b=5+3;
	 c=10-5+25+3+1;
	 
	 $display("\nOverflow");
	 $display("a = %d = %3b", a, a);
	 $display("b = %d = %4b", b, b);
	 $display("c = %d = %5b", c, c);
	 
// ------------------ complementos	 
	 $display("\nComplements");
    $display("0= %d = %3b = %3b", ~1 , (1-1), ~1 );
    $display("1= %d = %3b = %3b", ~0 , (2-1), ~0 );
    $display("2= %d = %3b = %3b", (1+1), (3-1), ~0+~0);
end
endmodule // test_base