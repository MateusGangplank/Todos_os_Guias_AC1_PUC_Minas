// -------------------------
// Exercicio0002 - BASE
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;

// ------------------------- parte principal
initial begin
$display("Exercicio0002 - Rafael Guimarães de Sousa - 451607");

a = 'b101010 + 'b11011;
b = 'b11011 + 'o25;
c = 'o1234 / 'h3C;
d = 'h1BA - 'b101110001;
e = 25 * 'o32 + 'h7A;

$display("a = %d = %b",a,a);
$display("b = %d = %b",b,b);
$display("c = %d = %b",c,c);
$display("d = %d = %b",d,d);
$display("e = %d = %b",e,e);

end
endmodule