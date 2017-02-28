// ----
// Exemplo0020 - BASE 
// Nome: Thais Pedrosa Gomes
// Matricula: 451616
// ----

// ----
// test number system 
// ----

module test_base_01;

// ---- definir dados
reg [5:0] a; 
reg [2:0] b; 
reg [4:0] c; 
reg [0:0] d;
reg [3:0] e;

// ---- parte principal 
initial begin
$display("Exemplo0020 - Thais Pedrosa Gomes - 451616"); 
$display("Test number system");

a = 'b101011 + (~'b1001 + 1);
b = 'b10011 + (~'o15 + 1);
c = 'o35 + (~'hC + 1);
d = 'hBA + (~'b10111001 + 1);
e = 'd37 + (~'h1B + 1);

$display("\nPositive Value");
$display("a = %d = %b", a, a);
$display("b = %d = %b", b, b);
$display("c = %d = %b", c, c);
$display("d = %d = %b", d, d);
$display("e = %d = %b", e, e);

end
endmodule // test_base 


