// -------------------------
// Exercicio0005 - BASE
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0005 - Rafael Guimarães de Sousa - 451607");

a = 'b101010 - 'b1001;
b = 'b11011 - 'o15;
c = 'o34 - 'hC;
d = 'hDA - 'b10111001;
e = 27 - 'h1B;

$display("a = %b = %b",~a,~a+~a);
$display("b = %b = %b",~b,~b+~b);
$display("c = %b = %b",~c,~c+~c);
$display("d = %b = %b",~d,~d+~d);
$display("e = %b = %b",~e,~e+~e);

end
endmodule