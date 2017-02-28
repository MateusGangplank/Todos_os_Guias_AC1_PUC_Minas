// ---------------------
// Exercicio0008 - AND
// Nome: Lucas Cardoso
// Matricula: 441694
// ---------------------
// ---------------------
// -- and gate
// ---------------------
module andgate ( output s,
input a,
input b,
input c,
input d);

assign s = a & b & c & d;

endmodule //
// ---------------------
// -- test andgate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a,b,c,d; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b, c, d);
// ------------------------- preparacao
initial begin:start
a=0;
b=0;
c=0;
d=0;
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio0008 - Lucas Cardoso - 441694");
$display("Test AND gate");
$display("\na & b & c & d = s\n");
$monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
a=0; b=0; c=0; d=0;
#1 a=0; b=0; c=0; d=1;
#1 a=0; b=0; c=1; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=0; b=1; c=0; d=0;
#1 a=0; b=1; c=0; d=1;
#1 a=0; b=1; c=1; d=0;
#1 a=0; b=1; c=1; d=1;
#1 a=1; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=0; c=1; d=0;
#1 a=1; b=0; c=1; d=1;
#1 a=1; b=1; c=0; d=0;
#1 a=1; b=1; c=0; d=1;
#1 a=1; b=1; c=1; d=0;
#1 a=1; b=1; c=1; d=1;

end
endmodule // testandgate