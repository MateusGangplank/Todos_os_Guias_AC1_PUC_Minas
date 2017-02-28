// ---------------------
// Exercicio08 - and (4 entradas)
// Nome: Raphael Quintao
// Matricula: 445171
// ---------------------
// ---------------------
// -- and gate
// ---------------------
module andgate (output s, input a, b, c, d);
assign s = (a & b) & (c & d);
endmodule // and
// ---------------------
// -- test andgate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a,b,c,d; // definir registrador
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate and1 (s, a, b, c, d);
// ------------------------- preparacao
initial begin:start
a=0;
b=0;
c=0;
d=0;
end
// ------------------------- parte principal
initial begin:main
$display("Exercicio08 - Raphael Quintao - 445171");
$display("Test and gate(4 entradas)");
$display("\na x b = s\n");
$monitor("%b x %b x %b x %b = %b", a, b, c, d, s);

#1 a=0; b=0; c=0; d=0;
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