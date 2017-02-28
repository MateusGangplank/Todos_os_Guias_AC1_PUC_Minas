//-------------------------
// Exemplo0032 - F4
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s, output s1, input  a, input  b, input c);
//------------------------- descrever por portas
wire s2, s3, s4, s5, s6, s7, s8, s9, nc;
and AND1 (s5, a, b);
and AND2 (s6, s2, nc);
and AND3 (s7, s3, c);
and AND4 (s8, s4, nc);
and AND5 (s9, s5, c);
not NOT1 (nc, c);
or OR1 (s3, a, b);
or OR2 (s, s6, s7);
or OR3 (s1, s8, s9);
nor NOR1 (s2, a, b);
nand NAND1 (s4, a, b);
endmodule // f4
module test_f4;
// ------------------------- definir dados
reg [2:0] x;
wire z;
wire k;
f4 modulo (z, k, x[0], x[1], x[2]);
// ------------------------- parte principal
initial begin
$display("Exemplo0032 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Test LU's module");
x = 0;
// ------------------------- projetar testes do modulo
#1 $monitor("entradas : %3b %3b | Selecao: %3b | Saida: %3b , %3b",x[0],x[1],x[2],z,k);
    repeat (7) begin
	 #1 x = x+1;
	 end
end
endmodule // test_f4