
// Exercicio0003 - XNOR
// Nome: �tila Martins Silva J�nior
// Matricula: 449014

// -- xnor gate
module xnorgate ( output s,
input p,
input q);
assign s = ~(p ^ q);
endmodule // xnorgate

// -- test xnor gate
module testxnorgate;

// -- dados locais
reg a, b; // definir registradores
wire s; // definir conexao (fio)

// -- instancia
xnorgate XNOR1 (s, a, b);

// -- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0;
end

// -- parte principal
initial begin
$display("Exercicio0003 - �tila Martins - 449014");
$display("Test XNOR gate");
$display("\na ^ b = s\n");
a=0; b=0;
#1 $display("%b ^ %b = %b", a, b, s);
a=0; b=1;
#1 $display("%b ^ %b = %b", a, b, s);
a=1; b=0;
#1 $display("%b ^ %b = %b", a, b, s);
a=1; b=1;
#1 $display("%b ^ %b = %b", a, b, s);
end
endmodule // testxnorgate