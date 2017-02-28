// -------------------------
// Exemplo0002 - NOT
// Nome: Rafael Guimar�es de Sousa
// Matricula: 451607
// -------------------------
// -------------------------
// -- not gate
// -------------------------
module notgate (output s,
input p);
assign s = ~p;
endmodule // notgate
// -------------------------
// -- test not gate
// -------------------------
module testnotgate;
// ------------------------- dados locais
reg a; // definir registrador
// (variavel independente)
wire s; // definir conexao (fio)
// (variavel dependente )
// ------------------------- instancia
notgate NOT1 (s, a);
// ------------------------- preparacao
initial begin:start
a=0; // valor inicial
end// ------------------------- parte principal
initial begin
$display("Exemplo0002 - Rafael Guimar�es de Sousa - 451607");
$display("Test NOT gate");
$display("\n~a = s\n");
a=0;
#1 $display("~%b = %b", a, s);
a=1;
#1 $display("~%b = %b", a, s);
end
endmodule // testnotgate