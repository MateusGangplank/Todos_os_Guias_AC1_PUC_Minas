// Rafael Guimarães de Sousa - 451607

module complemento;

reg [4:0] a;
reg [3:0] b;
reg [2:0] c;
reg [4:0] d;
reg [3:0] e;

initial begin

a = ~'b101010 + 'b1;
b = ~'o25 + 'b1;
c = ~27 +'b1;
d = ~'h2C +'b1;
e = ~(25 - 35) + 'b1;

$display("Exemplo0017 - Rafael Guimarães de Sousa - 451607");

$display("a) 101010(2) = %b",a);
$display("b) 25(8) = %b",b);
$display("c) 27 = %b",c);
$display("d) 2C(16) = %b",d);
$display("e) 25 - 35 = %b",e);

end
endmodule