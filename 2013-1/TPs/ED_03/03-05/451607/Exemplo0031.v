// -------------------------
// Exemplo0031 - F4
// Nome: Rafael Guimarães de Sousa
// Matricula: 451607
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output [7:0] s,input [3:0] a,input [3:0] b);

or OR1 (s[0], a[0], b[0]);
or OR2 (s[1], a[1], b[1]);
or OR3 (s[2], a[2], b[2]);
or OR4 (s[3], a[3], b[3]);

and AND1 (s[4], a[0], b[0]);
and AND2 (s[5], a[1], b[1]);
and AND3 (s[6], a[2], b[2]);
and AND4 (s[7], a[3], b[3]);

endmodule // f4

module test_f4;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [7:0] z;

f4 modulo (z, x, y);
// ------------------------- parte principal
initial begin

$display("Exemplo0031 - Rafael Guimarães de Sousa - 451607");
$display("Test LU's module");

x = 4'b0011; y = 4'b0101;

$monitor("x | y = %4b \t x & y = %4b",z[3:0],z[7:4]);

end
endmodule // test_f4