// -------------------------
// Exemplo0035 
// Nome: Raphael Quintao
// Matricula: 445171
// -------------------------
// -------------------------
// 
// -------------------------
module f4 (output s, input a,input b, input [2:0]k);

wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16;

not notA(s1, a);
not notB(s2, b);
or or1(s3, a, b);
nor nor1(s4, a, b);
and and1(s5, a, b);
nand nand1(s6, a, b);
xor xor1(s7, a, b);
xnor xnor1(s8, a, b);


and and2(s9,  s1, ~k[2], ~k[1], ~k[0]);
and and3(s10, s2, ~k[2], ~k[1], k[0]);
and and4(s11, s3, ~k[2], k[1], ~k[0]);
and and5(s12, s4, ~k[2], k[1], k[0]);
and and6(s13, s5, k[2], ~k[1], ~k[0]);
and and7(s14, s6, k[2], ~k[1], k[0]);
and and8(s15, s7, k[2], k[1], ~k[0]);
and and9(s16, s8, k[2], k[1], k[0]);

or  or2 (s, s9, s10, s11, s12, s13, s14, s15, s16);

endmodule // f4
module test_f4;
// ------------------------- definir dados
reg x;
reg y;
reg [2:0]k;
wire s;
f4 modulo (s, x, y, k[2:0]);
// ------------------------- parte principal
initial begin
$display("Exemplo0035 - Raphael Quintao - 445171");
$display("Test LU's module");

x = 0; y = 0; k = 3'b000;

$monitor("x = %1b -- y = %1b k1 = %3b Resultado = %1b",x, y, k, s);

#1x = 0; y = 1; k = 3'b000;
#1x = 1; y = 0; k = 3'b000;
#1x = 1; y = 1; k = 3'b000;

#1x = 0; y = 0; k = 3'b001;
$display("\n");
#1x = 0; y = 1; k = 3'b001;
#1x = 1; y = 0; k = 3'b001;
#1x = 1; y = 1; k = 3'b001;

#1x = 0; y = 0; k = 3'b010;
$display("\n");
#1x = 0; y = 1; k = 3'b010;
#1x = 1; y = 0; k = 3'b010;
#1x = 1; y = 1; k = 3'b010;

#1x = 0; y = 0; k = 3'b011;
$display("\n");
#1x = 0; y = 1; k = 3'b011;
#1x = 1; y = 0; k = 3'b011;
#1x = 1; y = 1; k = 3'b011;

#1x = 0; y = 0; k = 3'b100;
$display("\n");
#1x = 0; y = 1; k = 3'b100;
#1x = 1; y = 0; k = 3'b100;
#1x = 1; y = 1; k = 3'b100;

#1x = 0; y = 0; k = 3'b101;
$display("\n");
#1x = 0; y = 1; k = 3'b101;
#1x = 1; y = 0; k = 3'b101;
#1x = 1; y = 1; k = 3'b101;

#1x = 0; y = 0; k = 3'b110;
$display("\n");
#1x = 0; y = 1; k = 3'b110;
#1x = 1; y = 0; k = 3'b110;
#1x = 1; y = 1; k = 3'b110;

#1x = 0; y = 0; k = 3'b111;
$display("\n");
#1x = 0; y = 1; k = 3'b111;
#1x = 1; y = 0; k = 3'b111;
#1x = 1; y = 1; k = 3'b111;


end
endmodule // test_f4