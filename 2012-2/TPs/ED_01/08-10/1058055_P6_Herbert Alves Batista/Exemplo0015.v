// -------------------------
// Exemplo0015 - OR 4 inputs
// Nome: HERBERT ALVES BATISTA
// Matricula: 461971
// -------------------------
// -------------------------
// -- or gate
// -------------------------
module orgate (output s,
input p,
input q);
assign s = p | q;
endmodule //orgate
module orgatetwo (output s,
input p,
input q);
assign s = p | q;
endmodule //orgatetwo
module orgatethree (output s,
input p,
input q);
assign s = p | q;
endmodule //orgatethree

// ---------------------
// -- test orgate
// ---------------------
module testorgate;
// ------------------------- dados locais
reg a,b,c,d; // definir registrador
wire s,t,u; // definir conexao (fio)
// ------------------------- instancia
orgate OR1 (s, a, b);
orgatetwo OR2 (t, c, d);
orgatethree OR3 (u, s, t);
// ------------------------- preparacao
initial begin:start
a=0; b=0; c=0; d=0; 
end
// ------------------------- parte principal
initial begin:main
$display("Exemplo0015 - Herbert Alves - 461971");
$display("Test or gate");
$display("\n (a+b) + (c+d) = s\n");
$monitor("(%b + %b) + (%b + %b) = %b", a, b, c, d, u);
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
endmodule // testorgate