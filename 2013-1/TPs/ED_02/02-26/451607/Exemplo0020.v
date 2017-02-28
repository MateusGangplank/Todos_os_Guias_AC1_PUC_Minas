// Rafael Guimarães de Sousa - 451607

module complemento;

reg [7:0] a;
reg [7:0] b;
reg [7:0] c;
reg [7:0] d;
reg [7:0] e;

initial begin

a = 'b101011 + (~'b1001 + 'b1);
b = 'b10011 + (~'o15 + 'b1);
c = 'o35 + (~'hC + 'b1);
d = 'hBA +(~'b10111001 + 'b1);
e = 37 + (~'h1B + 'b1);

$display("Exemplo0020 - Rafael Guimarães de Sousa - 451607");

$display("a) 101011(2) - 1001(2) = %b",a);
$display("b) 10011(2) - 15(8) = %b",b);
$display("c) 35(8) - C(16) = %b",c);
$display("d) BA(16) - 10111001(2) = %b",d);
$display("e) 37 - 1B(16) = %b",e);

end
endmodule