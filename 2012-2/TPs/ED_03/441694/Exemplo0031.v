// -------------------------
// Exemplo0031 - F4
// Nome: Lucas Cardoso
// Matricula: 441694
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module BOX1 (output [3:0] s,
input [3:0] a,
input [3:0] b);

and AND1 ( s[0], a[0], b[0] );
and AND2 ( s[1], a[1], b[1] );
and AND3 ( s[2], a[2], b[2] );
and AND4 ( s[3], a[3], b[3] );

endmodule // BOX1

module BOX2 (output [3:0] s1,
input [3:0] a,
input [3:0] b);

or OR1 ( s1[0], a[0], b[0] );
or OR2 ( s1[1], a[1], b[1] );
or OR3 ( s1[2], a[2], b[2] );
or OR4 ( s1[3], a[3], b[3] );

endmodule // BOX2
module test_f4;
// ------------------------- definir dados
reg [3:0] x;
reg [3:0] y;
wire [3:0] s;
wire [3:0] r;
BOX1 modulo1 (s, x, y);
BOX2 modulo2 (r, x, y);
// ------------------------- parte principal
initial begin  
$display("Exemplo0031 - Lucas Cardoso - 441694");
$display("Test LU's module");
x = 4'b0000; y = 4'b0000;
// projetar testes do modulo
$display(" a    b    s    s1");
#1 $monitor("%4b %4b %4b %4b",x,y,s,r);
#1 x = 4'b0011; y = 4'b0101;
#1 x = 4'b1100; y = 4'b0001;
#1 x = 4'b0001; y = 4'b1000;
#1 x = 4'b1110; y = 4'b0001;
#1 x = 4'b0010; y = 4'b0100;
#1 x = 4'b1111; y = 4'b1111;

end
endmodule // test_f4