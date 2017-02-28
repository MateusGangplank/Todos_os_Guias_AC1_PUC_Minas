// ----
// Exemplo0016 - BASE 
// Nome: Thais Pedrosa Gomes
// Matricula: 451616
// ----

// ----
// test number system 
// ----

module test_base_01;

// ---- definir dados
reg [4:0] a; 
reg [4:0] b; 
reg [2:0] c; 
reg [3:0] d;
reg [4:0] e;


// ---- parte principal 
initial begin
$display("Exemplo0016 - Thais Pedrosa Gomes - 451616"); 
$display("Test number system");

a = 3 + 14;
b = 3 * 8;
c = 33 / 3;
d = 25 - 11;
e = 2 * 8 + 7 - 1;

$display("\nPositive Value");
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);

end
endmodule // test_base 


