// -------------------------
// Exercicio10 - OR
// Nome: F�bio Fiuza Pereira
// Matricula: 406087
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate (output s, input x, input y);
//imput x,y);
assign s= (x|y);
endmodule // orgate
//module or2gate ( output s, imput t, k, z, w);
module or2gate ( output s, input t, input k, input z, input w);

wire temp1, temp2;

//oragate 1(temp1, t, k);
//oragate 2(s, temp1, temp2);
or2gate gate1(temp1, t, k);
or2gate gate2(s, temp1, temp2);

//ormodule // orgate
endmodule

// ---------------------
// -- test and gate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate OR1 (s, a, b);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio09 - F�bio Fiuza Pereira - 406087");
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
//ormodule // testandgate
endmodule
