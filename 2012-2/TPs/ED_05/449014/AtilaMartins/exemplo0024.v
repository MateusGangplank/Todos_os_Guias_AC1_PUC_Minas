
// Exemplo0024 – ComparadorDiferenca_3bits
// Nome: Átila Martins Silva Júnior
// Matricula: 449014


// comparador de diferenca 3 bits

//--compara diferença
module comparaDiferenca(output s, input[2:0] a, input[2:0] b);
	wire w1,w2,w3,s0;
	xor(w1, a[0], b[0]);
	xor(w2, a[1], b[1]);
	xor(w3, a[2], b[2]);
	or(s0, w1, w2);
	or(s, s0, w3);
endmodule

//--teste
module testComparaDiferenca;

//--instancias
reg[2:0] x;
reg[2:0] y;
wire result;

comparaDiferenca CI(result, x, y);

initial begin
$display("Exemplo0023 - Átila Martins Silva Júnior - 449014");
$display("Compara a com b: 1 diferente, 0 igual,");
x = 3'b101; y = 3'b110;
$monitor("a: %b\tb: %b\ts: %b", x, y, result);
#1 x = 3'b111; y = 3'b000;
#1 x = 3'b011; y = 3'b001;
#1 x = 3'b011; y = 3'b011;
#1 x = 3'b110; y = 3'b011;
end
endmodule