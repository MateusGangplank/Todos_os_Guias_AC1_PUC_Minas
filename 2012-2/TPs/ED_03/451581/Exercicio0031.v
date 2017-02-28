// -------------------------
// Exemplo0031 - F2
// Nome: Ítalo Guimarães Otoni
// Matricula: 451581
// -------------------------

module F2 (output [7:0]s, input [3:0]a, input[3:0]b);

or or0 (s[0],a[0],b[0]);
or or1 (s[1],a[1],b[1]);
or or2 (s[2],a[2],b[2]);
or or3 (s[3],a[3],b[3]);

and and0 (s[4],a[0],b[0]);
and and1 (s[5],a[1],b[1]);
and and2 (s[6],a[2],b[2]);
and and3 (s[7],a[3],b[3]);

endmodule

module TESTEF2;

reg [3:0]x;
reg [3:0]y;
wire [7:0]z;

initial begin
x='b0000;
y='b0000;
end

F2 portas (z,x,y);

initial begin

$display("Exercicio0031 - Ítalo Guimarães Otoni - 451581");
$display("\n");

$monitor("x & y = %b    x | y =  %b",z[7:4],z[3:0]);
#1 x='b0001;
#1 x='b0000;y='b0011;
#1 x='b1111;


end
endmodule