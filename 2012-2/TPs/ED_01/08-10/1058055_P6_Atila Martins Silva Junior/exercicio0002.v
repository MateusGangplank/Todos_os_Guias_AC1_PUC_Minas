
// Exercicio0002 - NOR
// Nome: �tila Martins Silva J�nior
// Matricula: 449014

// -- nor gate
module norgate ( output s,
input p,
input q);
assign s = ~(p | q);
endmodule // norgate

// -- test nor gate
module testnorgate;

// -- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)

// --- instancia
norgate NOR1 (s, a, b);

// -- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end

// -- parte principal
initial begin
$display("Exercicio0002 - �tila Martins - 449014");
$display("Test NOR gate");
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
endmodule // testnorgate