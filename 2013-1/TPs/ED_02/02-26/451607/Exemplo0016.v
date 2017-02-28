// Rafael Guimarães de Sousa - 451607

module somar;

reg [4:0] a;
reg [4:0] b;
reg [2:0] c;
reg [3:0] d;
reg [4:0] e;

initial begin

a = 17;
b = 3 * 8;
c = 33 / 5;
d = 25 - 11;
e = (2 * 8) + 7 - 1;

$display("Exemplo0016 - Rafael Guimarães de Sousa - 451607");

$display("a) 3 + 14 = %d = %b",a,a);
$display("b) 3 * 8 = %d = %b",b,b);
$display("c) 33 / 5 = %d = %b",c,c);
$display("d) 25 - 11 = %d = %b",d,d);
$display("e) (2 * 8) + 7 - 1 = %d = %b",e,e);


end
endmodule