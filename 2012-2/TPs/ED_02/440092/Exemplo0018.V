// -------------------------
// Exemplo0018 - BASE
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// test number system
// -------------------------
module test_base_01;
// ------------------------- definir dados
reg [7:0] a;
reg [8:0] b;
reg [6:0] c;
reg [4:0] d;
reg [4:0] e;
// ------------------------- parte principal
initial begin
$display("Exemplo0018 - Ailton Gomes - 440092");
$display("Test number system");
a = ~(6'b100110)+1; 
b = ~(5'o24)+1 ;
c = ~(6'd25)+1;
d = ~(6'h2d)+1;
e = ~(27 - 37)+1;
$display("a = %d = %5b", a, a);
$display("b = %d = %5b", b, b);
$display("c = %d = %3b", c, c);
$display("d = %d = %4b", d, d);
$display("e = %d = %5b", e, e);
end
endmodule // test_base