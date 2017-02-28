// -------------------------
// Exemplo0033 - F4
// Nome: Bernardo Augusto Godinho de Oliveira
// Matricula: 458576
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s,
output s1,
input a,
input b,
input x);

wire a1 = x & a;
wire a2 = x & b;
wire o1 = ~x & a;
wire o2 = ~x & b;
wire and1 = a1 & a2;
wire or1 = o1 | o2;

assign s = or1 | and1;
assign s1 = ~(or1 | and1);
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg x;
reg y;
reg z;
wire z0;
wire z1;
f4 modulo (z0, z1, x, y, z);
// ------------------------- parte principal
initial begin

x = 1; y = 1; z = 1;
// projetar testes do modulo
#1 $display("%3b %3b %3b %3b %3b",x,y,z, z0, z1);
end
endmodule // test_f4