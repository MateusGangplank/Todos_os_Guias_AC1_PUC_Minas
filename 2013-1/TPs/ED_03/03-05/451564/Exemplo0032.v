// -------------------------
// Exemplo0032 - F4
// Nome: Guilherme Augusto Bueno Borba
// Matricula: 451564
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module f4 (output s1,
input  a,
input  b,
input c);
// descrever por portas
wire s5;
wire s6;
and AND3 (s5, a, b);
or OR4 (s6, a, b);
m M1 (s1, s5, s6, c);

endmodule // f4

module m (output s2,
input a,
input b,
input c);
// descrever por portas
wire s3;
wire s4;
wire nc;
not NOT1 (nc, c);
and AND1 (s3, a, nc);
and AND2 (s4, b, c);
or OR1 (s2, s3, s4);
endmodule // f4

module test_f4;
// ------------------------- definir dados
reg [2:0] x;
wire z;
f4 modulo (z, x[0], x[1], x[2]);
// ------------------------- parte principal
initial begin
$display("Exemplo0032 - Guilherme Augusto Bueno Borba - 451564");
$display("Test LU's module");
x = 0;
// projetar testes do modulo
#1 $monitor("entradas : %3b %3b | Selecao: %3b | Saida: %3b",x[1],x[0],x[2],z);
    repeat (7) begin
	 #1 x = x+1;
	 end
end
endmodule // test_f4