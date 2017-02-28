// -------------------------
// Exemplo0016 - BIT
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// -- bit gate
// -------------------------
module bitgate ( output u,
input [7:0]x);

assign u =~((x[0] | x[1])|(x[2] | x[3]))|((x[4] | x[5])|(x[6] | x[7])) ;
endmodule // bitgate
// ---------------------
// -- test bit gate
// ---------------------
module testbitgate;
// -------------------------
// ------------------------- dados locais
reg [7:0] x;
wire u; // definir conexao (fio)
// ------------------------- instancia
bitgate BIT1 (u, x);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
x=8'b00000100;
end
// ------------------------- parte principal
initial begin
$display("Exemplo0016 - Ailton Gomes - 440092");
$display("Test Bitgate");
$display("\na | b = s\n");

 $monitor("%b > 0 = %b", x, u);

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