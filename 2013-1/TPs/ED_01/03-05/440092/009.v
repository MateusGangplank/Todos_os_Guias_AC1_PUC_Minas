// -------------------------
// Exercico 009 - AND
// Nome: Ailton Gomes
// Matricula: 440092
// -------------------------
// -------------------------
// -- and gate
// -------------------------
module andgate ( output s,
input p,
input q);
assign s = p & q;
endmodule // andgate
// ---------------------
module and2gate ( output t,
input a,
input b,
input c);
wirel x;
andgate AND1 (x, a, b);
andgate AND2 (t, x, d);
endmodule // andgate
// -- test and gate
// ---------------------
module testandgate;
// ------------------------- dados locais
reg a, b, c; // definir registradores
wire u, s, t; // definir conexao (fio)
// ------------------------- instancia

and2gate AND3 (u, a, b, c);
// ------------------------- preparacao
initial begin:start
// atribuicao simultanea
// dos valores iniciais
a=0; b=0; c=0; 
end
// ------------------------- parte principal
initial begin
$display("Exercicio 009 - Ailton Gomes - 440092");
$display("Test AND gate");
$display("\n(a & b & c)= s\n");
#1 $monitor("(%b & %b & %b) = %b", a, b, c, u);
#1 a=0; b=0; c=0; 
#1 a=0; b=0; c=1; 
#1 a=0; b=1; c=0; 
#1 a=0; b=1; c=1; 
#1 a=1; b=0; c=0; 
#1 a=1; b=0; c=1; 
#1 a=1; b=1; c=0; 
#1 a=1; b=1; c=1; 

end
endmodule // testandgate