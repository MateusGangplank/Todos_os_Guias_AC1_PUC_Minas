// -------------------------
// Exemplo0032 - F4
// Nome: Pedro Henrique Lima Pinheiro
// Matricula: 451605
// -------------------------
// -------------------------
// f4_gate
// -------------------------

module f4 (output s1, output s2, input  a, input  b, input c);
// descrever por portas
wire s3, s4, s5, s6, s7, s8, s9, s10, nc;

and AND1 (s6, a, b);
and AND2 (s7, s3, nc);
and AND3 (s8, s4, c);
and AND4 (s9, s5, nc);
and AND5 (s10, s6, c);

not NOT1 (nc, c);

or OR1 (s4, a, b);
//or OR2 (s1, s7, s8):         // corrigido
or OR2 (s1, s7, s8);
or OR3 (s2, s9, s10);

nor NOR1 (s3, a, b);

nand NAND1 (s5, a, b);

endmodule // f4

module test_f4;
// ------------------------- definir dados
reg [2:0] x;
wire z;
wire k;
f4 modulo (z, k, x[0], x[1], x[2]);
// ------------------------- parte principal
initial begin
$display("Exemplo0032 - Pedro Henrique Lima Pinheiro - 451605");
$display("Test LU's module");
x = 0;
// projetar testes do modulo
#1 $monitor("entradas : %3b %3b | Selecao: %3b | Saida: %3b , %3b",x[0],x[1],x[2],z,k);
    repeat (7) begin
	 #1 x = x+1;
	 end
end
endmodule // test_f4