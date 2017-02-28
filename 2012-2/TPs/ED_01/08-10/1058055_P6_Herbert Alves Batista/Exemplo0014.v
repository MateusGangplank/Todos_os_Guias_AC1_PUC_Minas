// -------------------------
// Exemplo0014 - AND
// Nome: HERBERT ALVES BATISTA
// Matricula: 461971
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate (output s,
input p,
input q);
assign s = p*q;
endmodule //andgate
module andgatetwo (output s,
input p,
input q);
assign s = p*q;
endmodule //andgatetwo
module andgatethree (output s,
input p,
input q);
assign s = p*q;
endmodule //andgatethree

// ---------------------
// -- test andgate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a,b,c,d; // definir registrador
wire s,t,u; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b);
andgatetwo AND2 (t, c, d);
andgatethree AND3 (u, s, t);
// ------------------------- preparacao
initial begin:start
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin:main
$display("Exemplo0013 - Herbert Alves - 461971");
$display("Test and gate");
$display("\n (a b) * (c d) = s\n");
$monitor("(%b * %b) * (%b * %b) = %b", a, b, c, d, u);
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
endmodule // testxnorgate