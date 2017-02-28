// -------------------------
// Exemplo0011 - BASE
// Nome: Guilherme Augusto Bueno Borba
// Matricula: 451564
// -------------------------
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;
// ------------------------- parte principal
initial begin
$display("Exercicio01 - Guilherme Augusto Bueno Borba - 451564");
$display("Test number system");
a= ~'b101111+1;
b= ~'b111001+1; 
c= ~'d25+1;
d= 'hd+1;
e= ~'o24+1;
$display("\nPositive value");
$display("a = %d = %8b", a, a);
$display("b = %d = %7b", b, b);
$display("c = %d = %6b", c, c);
$display("d = %d = %5b", d, d);
$display("e = %d = %8b", e, e);
end
endmodule // test_base