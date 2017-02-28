// -------------------------
// Extra02 - receber 1 byte e retornar 1 se todos os bits forem iguais a 1
// Nome: TIAGO MATTA MACHADO ZAIDAN
// Matricula: 451620
// -------------------------
// -------------------------
// -- not/xor gate
// -------------------------
module notgate1 ( output [0:7] e,
input [0:7] a);
assign e = ~a;
endmodule // not
module xorgate1 ( output [0:7] s,
input [0:7] e, input [0:7] b);
assign s = e ^ b;
endmodule // xor
// ---------------------
// -- test xor gate
// ---------------------
module testxorgate;
// ------------------------- dados locais
reg [0:7] a,b; // definir registradores
wire [0:7] s,e; // definir conexao (fio)

// ------------------------- instancia
notgate1 NOT1 (e, a);
xorgate1 XOR1 (s, e, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=8'b11111111;
b=8'b00000001;
end
// ------------------------- parte principal
initial begin
$display("Extra01 - TIAGO MATTA MACHADO ZAIDAN - 451620");
$display("Test not/and");
$display("\n ~a = e,      e ^ b = s,     s to decimal = \n");
#0 a=8'b11111111; b=8'b00000001;
$display(" ~%b = %b,      %b ^ %b = %b,     to decimal = %d", a, e, e, b, s, s); // sera mostrado 1 apenas se todos os bits de a for igual a 1

end
endmodule // testgate