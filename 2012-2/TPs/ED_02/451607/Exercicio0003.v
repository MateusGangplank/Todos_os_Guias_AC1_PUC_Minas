// -------------------------
// Exercicio0003 - BASE
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [5:0] a;
reg [4:0] b;
reg [4:0] c;
reg [5:0] d;
reg [3:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0003 - Rafael Guimarães de Sousa - 451607");

a = 'b100110;
b = 'o24;
c = 25;
d = 'h2D;
e = 27 - 37;

$display("a = %b = %b",~a,~a+~a);
$display("b = %o = %o",~b,~b+~b);
$display("c = %d = %d",~c,~c+~c);
$display("d = %h = %h",~d,~d+~d);
$display("e = %d = %d",~e,~e+~e);

end
endmodule