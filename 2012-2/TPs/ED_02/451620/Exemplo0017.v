// -------------------------
// Exemplo0017 - Operecoes
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// test operecoes
// -------------------------
module test_base_07;
// ------------------------- definir dados
reg [6:0] a;
reg [5:0] b;
reg [3:0] c;
reg [6:0] d;
reg [9:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0017 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Operacoes: ");
a = 6'b101010 + 5'b11011;
b = 5'b11011 + 10'o25 ;
c = 10'o1234 / 10'h3C;
d = 10'h1BA - 9'b101110001;
e = 25 * 10'o32;
$display("a = 101010(2) +  11011(2) = %7b", a);
$display("b = 11011 + 25(8) = %6b", b);
$display("c = 1234(8) / 3C(16) = %4b", c);
$display("d = 1BA(16) - 101110001(2) = %7b", d);
$display("e = 25*32(8) = %10b", e);

end
endmodule // test_base