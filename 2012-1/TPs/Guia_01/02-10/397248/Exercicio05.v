// Exercicio05 - NOR 
// Nome: Marlon Henrique de Azeredo Formiga 
// Matricula: 397248 
// ------------------------- 
// ------------------------- 
// -- nor gate 
// ------------------------- 
module norgate ( output s, 
						input p, 
						input q); 
assign s = ~p & ~q; 
endmodule // norgate 
// --------------------- 
// -- test nor gate 
// --------------------- 
module testnorgate; 
// ------------------------- dados locais 
reg a, b; // definir registradores 
wire s; // definir conexao (fio) 
// ------------------------- instancia 
norgate NOR1 (s, a, b); 
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea dos valores iniciais 
a=0; b=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio05 - Marlon Henrique de Azeredo Formiga - 397248"); 
$display("Test NOR gate"); 
$display("\n~(a | b) = s\n"); 
a=0; b=0; 
#1 $display("~(%b | %b) = %b", a, b, s); 
a=0; b=1; 
#1 $display("~(%b | %b) = %b", a, b, s); 
a=1; b=0; 
#1 $display("~(%b | %b) = %b", a, b, s); 
a=1; b=1; 
#1 $display("~(%b | %b) = %b", a, b, s); 
end 
endmodule // testnorgate 