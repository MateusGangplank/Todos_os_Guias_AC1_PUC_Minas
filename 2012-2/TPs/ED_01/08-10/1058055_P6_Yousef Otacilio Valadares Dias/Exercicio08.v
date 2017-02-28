// -------------------------
// Exercicio 08 - AND 4 entradas
// Nome: Yousef
// Matricula: 441714
// -------------------------
// -------------------------
// -- Nor gate
// -------------------------
module andgate ( output s,
input x, y, z, w);
assign s = (x&y)&(z&w);
endmodule // andgate
// ---------------------
// -- test or gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c, d; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate AND4 (s, a, b, c, d);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; d=0;
end
// ------------------------- parte principal
initial begin
$display("Exercicio 08 - Yousef - 441714");
$display("Test AND4 gate");
$display("\n(a & b) & (a & b) = s\n");
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