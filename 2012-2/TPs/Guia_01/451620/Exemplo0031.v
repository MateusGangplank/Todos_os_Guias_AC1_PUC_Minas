// -------------------------
// Exemplo0031 - F4
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module fand4 (output [3:0] s,
input [3:0] a,
input [3:0] b);
and  ( s[0], a[0], b[0] );
and  ( s[1], a[1], b[1] );
and  ( s[2], a[2], b[2] );
and  ( s[3], a[3], b[3] );

endmodule // fand4

module for4 (output [3:0] s,
input [3:0] a,
input [3:0] b);
or  ( s[0], a[0], b[0] );
or  ( s[1], a[1], b[1] );
or  ( s[2], a[2], b[2] );
or  ( s[3], a[3], b[3] );

endmodule // for4

module test_f4;
// ------------------------- definir dados
reg [3:0] x,a;
reg [3:0] y,b;
wire [3:0] z,c;
fand4 AND(z, x, y);
for4  OR(c, a, b);
// ------------------------- parte principal
initial begin
$display("Exemplo0031 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test LU's module");
x = 4'b0011; y = 4'b0101;
a = 4'b0011; b = 4'b0101;
// projetar testes do modulo
#1 $display("%4b   and   %4b = %4b",x,y,z);

#1 $display("%4b    or    %4b = %4b",a,b,c);
end
endmodule // test_f4