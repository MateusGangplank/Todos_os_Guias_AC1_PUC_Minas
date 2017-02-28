// -------------------------
// Exemplo0032 - F4
// Nome: Thauan Velasco Cunha
// Matricula: 439995
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, input a, input b, input chave);
wire wire1;
and and1( wire1, a, b);
or or1( wire2, a, b);
and and2( wire3, wire1, chave);
and and3( wire4, wire2, ~chave);
or or2(s, wire3, wire4);
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg  x;
reg  y;
reg c;
wire z;
f4 modulo (z, x, y, c);
// ------------------------- parte principal
initial begin
$display("Exemplo0032 - Thauan Velasco - 439995");
$display("Test LU's module");
$monitor("Entrada A = %1b Entrada B = %1b Chave = %1b Saida = %1b", x, y, c, z);
#1 x=0; y=0; c=0;
#1 x=1; y=0; c=0;
#1 x=0; y=1; c=0;
#1 x=1; y=1; c=0;
#1 x=0; y=0; c=1;
#1 x=1; y=0; c=1;
#1 x=0; y=1; c=1;
#1 x=1; y=1; c=1;

end
endmodule // test_f4