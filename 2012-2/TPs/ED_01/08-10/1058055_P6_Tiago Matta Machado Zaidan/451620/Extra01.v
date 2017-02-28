// -------------------------
// Extra01 - receber 1 byte e retornar 1 se todos os bits forem iguais a 0
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// -- xor gate
// -------------------------
module xorgate1 ( output [0:7] s,
input [0:7] a, input [0:7] b);
assign s = a ^ b;
endmodule // xor
// ---------------------
// -- test xor gate
// ---------------------
module testxorgate;
// ------------------------- dados locais
reg [0:7] a,b; // definir registradores
wire [0:7] s; // definir conexao (fio)

// ------------------------- instancia
xorgate1 XOR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=8'b00000000;
b=8'b00000001;
end
// ------------------------- parte principal
initial begin
$display("Extra01 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test not/and");
$display("\n a ^ b = s,   s to decimal = \n");
#0 a=8'b00000000;  b=8'b00000001;
$display(" %b ^ %b = %b,   to decimal = %d", a, b, s, s);  // sera mostrado 1 apenas se todos os bits de a for igual a 0

end
endmodule // testgate