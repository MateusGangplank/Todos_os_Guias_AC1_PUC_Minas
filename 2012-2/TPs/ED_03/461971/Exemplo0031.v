// -------------------------
// Exemplo0031 - LU3
// Nome: Herbert Alves
// Matricula: 461971
// -------------------------
// -------------------------
// 
// -------------------------
module f4 (output [3:0] s,
input [3:0] a,
input [3:0] b);
and(s[0], a[0], b[0]);
and(s[1], a[1], b[1]);
and(s[2], a[2], b[2]);
and(s[3], a[3], b[3]);
endmodule // f4
module f5 (output [3:0] s,
input [3:0] a,
input [3:0] b);
or(s[0], a[0], b[0]);
or(s[1], a[1], b[1]);
or(s[2], a[2], b[2]);
or(s[3], a[3], b[3]);
endmodule // f5   
module test_f4;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] z;
wire [3:0] w;
f4 f4a(z, x, y);
f5 f5a(w, x, y);
// ------------------------- parte principal
initial begin
$display("Exemplo0031 - Herbert Alves - 461971");
$display("Test LU's module");
x = 4'b0011; y = 4'b0101;
$display("\n x, y = x^y - x|y\n");
#1 $display("%3b, %3b = %3b - %3b",x,y,z,w);
#1 x = 4'b1010; y = 4'b1100;
$display("%3b, %3b = %3b - %3b",x,y,z,w);
#1x = 4'b1111; y = 4'b0110;
$display("%3b, %3b = %3b - %3b",x,y,z,w);
#1x = 4'b0001; y = 4'b1001;
$display("%3b, %3b = %3b - %3b",x,y,z,w);
end
endmodule // test_f4