
// Exemplo0023 � ComparadorIgualdade_3bits
// Nome: �tila Martins Silva J�nior
// Matricula: 449014

// comparador de igualdade 3 bits

//--compara igualdade
module comparaIgualdade(output s, input[2:0] a, input[2:0] b);
	wire w1,w2,w3,s0;
	xor(w1, a[0], b[0]);
	xor(w2, a[1], b[1]);
	xor(w3, a[2], b[2]);
	or(s0, w1, w2);
	nor(s, s0, w3);
endmodule

//--test
module testComparaIgualdade;

//--instancias
reg[2:0] x;
reg[2:0] y;
wire result;

comparaIgualdade CI(result, x, y);

initial begin
$display("Exemplo0023 - �tila Martins Silva J�nior - 449014");
$display("Compara a com b: 1 igual, 0 diferente,");
x = 3'b101; y = 3'b110;
$monitor("a: %b\tb: %b\ts: %b", x, y, result);
#1 x = 3'b111; y = 3'b000;
#1 x = 3'b011; y = 3'b001;
#1 x = 3'b011; y = 3'b011;
#1 x = 3'b110; y = 3'b011;
end
endmodule