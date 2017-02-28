// -------------------------
// Exemplo0016 - Operecoes
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// test operacoes
// -------------------------
module test_base_06;
// ------------------------- definir dados
reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0016 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Operacoes: ");
a = 2 + 14;
b = 3 * 9;
c = 32 / 5;
d = 24 - 11;
e = 2 * 6 + 7 - 1;
$display("a = 2 + 14 = %d = %5b", a,a);
$display("b = 3 * 9 = %d = %5b", b,b);
$display("c = 32 / 5 = %d = %3b", c,c);
$display("d = 24 - 11 = %d = %4b", d,d);
$display("e = 2 * 6 + 7 - 1 = %d = %5b", e,e);

end
endmodule // test_base