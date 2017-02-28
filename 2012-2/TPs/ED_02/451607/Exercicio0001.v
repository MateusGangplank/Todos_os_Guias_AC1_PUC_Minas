// -------------------------
// Exercicio0001 - BASE
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0001 - Rafael Guimarães de Sousa - 451607");

a = 2 + 14;
b = 3 * 9;
c = 32 / 5;
d = 24 - 11;
e = (2 * 6) + 7 - 1;

$display("a = %d = %b",a,a);
$display("b = %d = %b",b,b);
$display("c = %d = %b",c,c);
$display("d = %d = %b",d,d);
$display("e = %d = %b",e,e);

end
endmodule