// ----
// Exemplo0018 - BASE 
// Nome: Thais Pedrosa Gomes
// Matricula: 451616
// ----

// ----
// test number system 
// ----

module test_base_01;

// ---- definir dados
reg [6:0] a; 
reg [5:0] b; 
reg [2:0] c; 
reg [6:0] d;
reg [3:0] e;

// ---- parte principal 
initial begin
$display("Exemplo0018 - Thais Pedrosa Gomes - 451616"); 
$display("Test number system");

a = ~'b101010 + 1;
b = ~'o25 + 1;
c = ~'d27 + 1;
d = ~'h2C + 1;
e = ~(25 - 35) + 1;

$display("\nPositive Value");
$display("a = %d = %b", a, a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);

end
endmodule // test_base 


