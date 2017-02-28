//-------------------------
// Exemplo0032 - F4
// Nome: Gabriel Carlos Damasceno Arriel
// Matricula: 451557
// -------------------------
// -------------------------
// f4_gate
// -------------------------
module f4 (output s,
input  a,
input  b,
input c);
// descrever por portas
wire s4;
wire s5;
and AND3 (s4, a, b);
or OR4 (s5, a, b);
mux M1 (s, s4, s5, c);

endmodule // f4

module mux (output s1,
input a,
input b,
input c);
// descrever por portas
wire s2;
wire s3;
wire nc;
not NOT1 (nc, c);
and AND1 (s2, a, nc);
and AND2 (s3, b, c);
or OR1 (s1, s2, s3);
endmodule // f4

module test_f4;
// ------------------------- definir dados
reg [2:0] x;
wire z;
f4 modulo (z, x[0], x[1], x[2]);
// ------------------------- parte principal
initial begin
$display("Exemplo0032 - Gabriel Carlos Damasceno Arriel - 451557");
$display("Test LU's module");
x = 0;
// projetar testes do modulo
#1 $monitor("Entradas : %3b %3b | Selecao: %3b | Saida: %3b",x[1],x[0],x[2],z);
    repeat (7) begin
	 #1 x = x+1;
	 end
end
endmodule // test_f4