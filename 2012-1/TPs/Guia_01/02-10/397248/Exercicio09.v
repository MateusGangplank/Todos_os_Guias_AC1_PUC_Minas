// Exercicio09 - AND c/ 3 entradas
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248 
// ------------------------- 
// ------------------------- 
// -- and gate 
// -------------------------

// UMA SAIDA, NAO DUAS !

module andgate ( output s,
						output w, 
						input p, 
						input q,
						input r); 
assign s = p & q;
assign w = s & r; 
endmodule // andgate 
// --------------------- 
// -- test and gate 
// --------------------- 
module testandgate; 
// ------------------------- dados locais 
reg a, b, c; // definir registradores 
wire s, w; // definir conexao (fio) 
// ------------------------- instancia 
andgate AND1 (s, w, a, b, c); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea dos valores iniciais 
a=0; b=0; c=0;
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio09 - Marlon Henrique de Azeredo Formiga - 397248"); 
$display("Test AND gate"); 
$display("\n(a & b) & c = s\n"); 
a=0; b=0; c=0;
#1 $display("(%b & %b) & %b = %b", a, b, c, w); 
a=1; b=0; c=0;
#1 $display("(%b & %b) & %b = %b", a, b, c, w); 
a=0; b=1; c=0;
#1 $display("(%b & %b) & %b = %b", a, b, c, w);
a=0; b=0; c=1; 
#1 $display("(%b & %b) & %b = %b", a, b, c, w);
a=1; b=1; c=0; 
#1 $display("(%b & %b) & %b = %b", a, b, c, w);
a=0; b=1; c=1;
#1 $display("(%b & %b) & %b = %b", a, b, c, w);
a=1; b=0; c=1;
#1 $display("(%b & %b) & %b = %b", a, b, c, w); 
a=1; b=1; c=1;
#1 $display("(%b & %b) & %b = %b", a, b, c, w); 
end 
endmodule // testandgate 