// -------------------------
// Exercicio09 - AND
// Nome: Fábio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// -- and gate
// -------------------------
Mmodule andgate (output s,
imput x,y);
assign s= (x&y);
endmodule // andgate
module and2gate ( output s, imput t, k, z, w);

wire temp1, temp2;

andagate 1(temp1, t, k);
andagate 2(s, temp1, temp2);

endmodule // andgate


// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exemplo03 - Fábio Fiuza Pereira - 406087");
$display("Test AND gate");
$display("\na & b = s\n");
a=0; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=0; b=1;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b & %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b & %b = %b", a, b, s);
end
endmodule // testandgate