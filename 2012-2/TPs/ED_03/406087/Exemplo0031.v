// -------------------------
// Exemplo0031
// Nome: fabio fiuza pereira
// Matricula: 406087
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output [3:0] s, output [3:0] g,
input [3:0] a,input [3:0] b);

   or or1(s[0], a[0], b[0]);
	or or2(s[1], a[1], b[1]);
	or or3(s[2], a[2], b[2]);
	or or4(s[3], a[3], b[3]);
	
	and and1(g[0], a[0], b[0]);
	and and2(g[1], a[1], b[1]);
	and and3(g[2], a[2], b[2]);
	and and4(g[3], a[3], b[3]);

endmodule // f4
module test_f4;


// ------------------------- definir dados


reg [3:0] x;
reg [3:0] y;
wire [3:0] z;
wire [3:0] w;
f4 modulo (z, w, x, y);


// ------------------------- parte principal


initial begin
$display("Exemplo0031 - 441714");
$display("Test LU");

x = 4'b0011; y = 4'b0101;

$monitor("\n %3b | %3b = %3b \n %3b & %3b = %3b",x,y,z,x,y,w );

#1x = 4'b0011; y = 4'b0101;
#1x = 4'b1111; y = 4'b0000;
#1x = 4'b0000; y = 4'b1111;
end
endmodule // test_f4