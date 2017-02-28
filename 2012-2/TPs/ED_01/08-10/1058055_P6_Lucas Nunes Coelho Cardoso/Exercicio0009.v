// ---------------------
// Exercicio0009 - AND
// Nome: Lucas Cardoso
// Matricula: 441694
// ---------------------
// ---------------------
// -- and gate
// ---------------------
module andgate1 ( output s1,
input a,
input b);

assign s1 = a & b;
endmodule // andgate1

module andgate2 ( output s2,
input c,
input d);

assign s2 = c & d;
endmodule // andgate2

module andgate ( output s,
input s1,
input s2);

assign s = s1 & s2;
endmodule // andgate
// ---------------------
// -- test andgate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a,b,c,d; // definir registrador
wire s, s1, s2; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, s1, s2);
andgate AND2 (s2, c, d);
andgate AND3 (s1, a, b);
// ------------------------- preparacao
initial begin:start
a=0;
b=0;
c=0;
d=0;
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio0009 - Lucas Cardoso - 441694");
$display("Test AND gate");
$display("\n(a & b) & (c & d) = s\n");
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