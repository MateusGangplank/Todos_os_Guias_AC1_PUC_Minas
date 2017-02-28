// -------------------------
// Exercicio9 - bit
// Nome: Fábio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module bitgate ( output a,
input [7:0]x);

assign a =~((x[0] | x[1])|(x[2] | x[3]))|((x[4] | x[5])|(x[6] | x[7])) ;
endmodule // bitgate
// ---------------------
// -- test bit gate
// ---------------------
module testbitgate;
// -------------------------
// ------------------------- dados locais
reg [7:0] x;
wire a; // definir conexao (fio)
// ------------------------- instancia
bitgate BIT1 (a, x);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
x=8'b00000100;
end
// ------------------------- parte principal
initial begin
$display("Exemplo16 - Fábio Fiuza Pereira");
$display("Test Bitgate");
$display("\na | b = s\n");

 $monitor("%b > 0 = %b", x, a);

#1 x=8'b00000000;
#1 x=8'b00000001;
#1 x=8'b00000010;
#1 x=8'b00000100;
#1 x=8'b00001000;
#1 x=8'b00010000;
#1 x=8'b00100000;
#1 x=8'b01000000;
#1 x=8'b10000000;
#1 x=8'b11111111;
end
endmodule // testorgate