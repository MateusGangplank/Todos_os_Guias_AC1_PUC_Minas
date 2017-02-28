// -------------------------
// Exemplo0021 – COMPARADOR  DE IGUALDADE
// Nome: Guilherme Moreira Nunes
// Matricula: 408947
// -------------------------
// -------------------------
// compara
// -------------------------
module compara (output s, input a, input b);

xnor XNOR1(s, a, b);

endmodule // compara
module test_compara;
// ------------------------- definir dados
reg[2:0] x;
reg[2:0] y;
wire[2:0] compara;

compara compara1(compara[0], x[0], y[0]);
compara compara2(compara[1], x[1], y[1]);
compara compara3(compara[2], x[2], y[2]);
// ------------------------- parte principal
initial begin
$display("Exemplo0021 - Guilherme Moreira Nunes - 408947");
$display("Test ALU’s COMPARADOR  DE IGUALDADE");
$display(" x  ?=  s");
#1 x = 3'b000; y = 3'b000;
$monitor("%b ?= %b --> %b", x, y, compara);

#1 x = 3'b001; y = 3'b001; 
#1 x = 3'b100; y = 3'b001; 
#1 x = 3'b111; y = 3'b111;
// projetar testes
end
endmodule // test_compara