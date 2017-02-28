// -------------------------
// Exemplo0021 – SUBTRATOR
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -----------Subtrator completo
// --------------
// -------------------------

module test_subtrator;
// ------------------------- definir dados
reg [1:0] x;
reg [1:0] y;
wire [1:0] sub;
wire [10:0] temp;
wire co;
xor(sub[0], x[0], y[0]);
and(temp[0], ~x[0], y[0]);
xor(temp[1], x[1], y[1]);
and(temp[2], ~x[1], y[1]);
xor(sub[1], temp[0],temp[1]);
and(temp[3], temp[0], ~temp[1]);
or(co, temp[3], temp[2]);


// ------------------------- parte principal
initial begin
$display("Exemplo0021 - Herbert Alves - 461971");
$display("Test ALU’s full adder");
$display("\n x - y = CarryOut sub\n");
 x=2'b11; y=2'b10;
#1 $display("%b - %b = %b %b", x, y, co, sub);
#1 x=2'b01; y=2'b11;
$monitor("%b - %b = %b %b", x, y, co, sub);
#1 x=2; y=3;
#1 x=3; y=1;
end
endmodule // test_subtrator