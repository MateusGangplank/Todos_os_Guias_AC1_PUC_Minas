// -------------------------
// Exercicio 10 - OR 4 entradas
// Nome: Yousef
// Matricula: 441714
// -------------------------
// -------------------------
// -- OR gate
// -------------------------

module orgate ( output s,
input x, y);
assign s = (x|y);
endmodule // orgate

//------------------------------

module or4gate ( output s,
input t, k, z, w);
wire temp1, temp2;

orgate galo(temp1, t, k );
orgate zeiro(temp2, z, w );
orgate america (s, temp1, temp2);

endmodule // orgate

// ---------------------
// -- test or gate
// ---------------------
module testor4gate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
or4gate OR4 (s, a, b, c, d);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio 10 - Yousef - 441714");
$display("Test OR4 gate");
$display("\n(a | b) | (a | b) = s\n");
$monitor("%b Y %b Y %b Y %b = %b", a, b, c, d, s);

#1a=0; b=0; c=0; d=0;
#1a=0; b=0; c=0; d=1; 
#1a=0; b=0; c=1; d=0; 
#1a=0; b=0; c=1; d=1; 
#1a=0; b=1; c=0; d=0; 
#1a=0; b=1; c=0; d=1; 
#1a=0; b=1; c=1; d=0;  
#1a=0; b=1; c=1; d=1;
#1a=1; b=0; c=0; d=0;
#1a=1; b=0; c=0; d=1; 
#1a=1; b=0; c=1; d=0; 
#1a=1; b=0; c=1; d=1; 
#1a=1; b=1; c=0; d=0; 
#1a=1; b=1; c=0; d=1; 
#1a=1; b=1; c=1; d=0;  
#1a=1; b=1; c=1; d=1;   


end
endmodule // testxorgate