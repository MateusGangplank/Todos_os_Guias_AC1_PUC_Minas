// -------------------------
// Exemplo0021 – FULL ADDER
// Nome: Herbert ALves
// Matricula: 461971
// -------------------------
// -------------------------
// full adder
// -------------------------

module test_fullAdder;
// ------------------------- definir dados
reg [2:0] x;
reg [2:0] y;
reg carry;
wire [2:0] soma;
wire [10:0] temp;
wire co;
xor(temp[0], x[0], y[0]);
and(temp[1], x[0], y[0]);
xor(soma[0], temp[0], carry);
and(temp[2], temp[0], carry);
or(temp[3], temp[1], temp[2]);
xor(temp[4], x[1], y[1]);
xor(soma[1], temp[4], temp[3]);
and(temp[5], x[1], y[1]);
and(temp[6], temp[4], temp[3]);
or(temp[7], temp[6], temp[5]);
xor(temp[8], x[2], y[2]);
xor(soma[2], temp[8], temp[7]);
and(temp[9], x[2], y[2]);
and(temp[10], temp[7], temp[8]);
or(co, temp[9], temp[10]);


// ------------------------- parte principal
initial begin
$display("Exemplo0021 - Herbert Alves - 461971");
$display("Test ALU’s full adder");
$display("\n x + y = CarryOut soma\n");
 x=3'b011; y=3'b010; carry=0;
#1 $display("%b + %b = %b %b", x, y, co, soma);
#1 x=3'b101; y=3'b011; carry=0;
$monitor("%b + %b = %b %b", x, y, co, soma);
#1 x=2; y=2; carry=0;
#1 x=7; y=7; carry=0;
end
endmodule // test_fullAdder