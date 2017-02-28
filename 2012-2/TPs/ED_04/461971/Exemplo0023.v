// -------------------------
// Exemplo0021 – COMPARADOR IGUALDADE
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -----------
// --------------
// -------------------------
module compara (output s,
input a,
input b,
input c);
nor(s, a, b, c);
endmodule // compara
module test_subtrator;
// ------------------------- definir dados
reg [1:0] x;
reg [1:0] y;
wire [1:0] sub;
wire [10:0] temp;
wire co, s;
xor(sub[0], x[0], y[0]);
and(temp[0], ~x[0], y[0]);
xor(temp[1], x[1], y[1]);
and(temp[2], ~x[1], y[1]);
xor(sub[1], temp[0],temp[1]);
and(temp[3], temp[0], ~temp[1]);
or(co, temp[3], temp[2]);
compara c1(s, co, sub[0], sub[1]);

// ------------------------- parte principal
initial begin
$display("Exemplo0021 - Herbert Alves - 461971");
$display("Test Comparador Igualdade");
$display("\n x = y = 1-sim, 0-nao\n");
 x=2'b11; y=2'b11;
#1 $display("%b = %b = %b ", x, y, s);
#1 x=2'b01; y=2'b11;
$monitor("%b = %b = %b ", x, y, s);
#1 x=2; y=3;
#1 x=2; y=2;
end
endmodule // test_comparador