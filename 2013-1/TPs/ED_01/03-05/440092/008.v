// -------------------------
// Exercico 008 - AND
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
input p,
input m,
input n);
assign s = (p & (q & n));
endmodule // andgate
// ---------------------
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c; // definir registradores
wire s; // definir conexao (fio)
// ------------------------- instancia
andgate AND1 (s, a, b, c);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; 
end
// ------------------------- parte principal
initial begin
$display("Exercicio008 - Ailton Gomes - 440092");
$display("Test AND gate");
$display("\na & b & c = s\n");
a=0; b=0; c=0; 
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=1; b=0; c=0; 
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=0; b=1; c=0; 
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=1; b=1; c=0; 
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=0; b=0; c=1; 
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=1; b=0; c=1; 
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=0; b=1; c=1; 
#1 $display("%b & %b & %b = %b", a, b, c, s);
a=1; b=1; c=1; 
#1 $display("%b & %b & %b = %b", a, b, c, s);
end
endmodule // testandgate