// Rafael Guimarães de Sousa - 451607

module somar;

reg [6:0] a;
reg [4:0] b;
reg [3:0] c;
reg [2:0] d;
reg [4:0] e;

initial begin

a = 'b100110 + 'b11011;
b = 'b11101 + 'o25;
c = 'o1234 / 'h4C;
d = 'h1BA - 'b101110011;
e = 'd25 * 'o32 + 'h8A;

$display("Exemplo0017 - Rafael Guimarães de Sousa - 451607");

$display("a) 100110(2) + 11011(2) = %d = %b",a,a);
$display("b) 11101(2) + 25(8) = %d = %b",b,b);
$display("c) 1234(8) / 4C(16) = %d = %b",c,c);
$display("d) 1BA(16) – 101110011(2) = %d = %b",d,d);
$display("e) 25 * 32(8) + 8A(16) = %d = %b",e,e);

end
endmodule