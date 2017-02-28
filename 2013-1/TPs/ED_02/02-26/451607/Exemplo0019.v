// Rafael Guimarães de Sousa - 451607

module complemento;

reg [7:0] a;
reg [6:0] b;
reg [5:0] c;
reg [4:0] d;
reg [7:0] e;

initial begin

a = ~'b101111 + 'b1;
b = ~'b111001 + 'b1;
c = ~25 +'b1;
d = ~'hD +'b1;
e = ~'o24 + 'b1;

$display("Exemplo0019 - Rafael Guimarães de Sousa - 451607");

$display("a) 101111(2) = %b",a);
$display("b) 321(4) = %b",b);
$display("c) 25 = %b",c);
$display("d) D(16) = %b",d);
$display("e) 24(8) = %b",e);

end
endmodule