// -------------------------
// Exercicio0010 - OR 
// Nome: Gabriel Luiz M. G. Vieira 
// Matricula: 441691 
// ------------------------- 
// ------------------------- 
// -- or gate & or gate2 
// ------------------------- 
module orgate ( output s1, 
input p, 
input q); 
assign s1 = p | q; 
endmodule // orgate 

module orgate2 ( output s2, 
input s1, 
input r); 
assign s2 = s1 | r; 
endmodule // orgate2 
// --------------------- 
// -- test or gate 
// --------------------- 
module testorgate; 
// ------------------------- dados locais 
reg a, b ,c; // definir registradores 
wire s1,s2; // definir conexao (fio) 
// ------------------------- instancia 
orgate OR1 (s1, a, b);                // DEFINIR EM OUTRO MODULO
orgate2 OR2 (s2, s1, c);  
// ------------------------- preparacao 
initial begin:start 
// atribuicao simultanea 
// dos valores iniciais 
a=0; b=0; c=0; 
end 
// ------------------------- parte principal 
initial begin 
$display("Exercicio0010 - Gabriel Luiz M. G. Vieira - 441691"); 
$display("Test OR gate"); 
$display("\na | b | c = s1\n");

$monitor("%b | %b | %b = %b", a, b, c, s2); 

#1a=0; b=0; c=1;
#1a=0; b=1; c=0;
#1a=0; b=1; c=1;
#1a=1; b=0; c=0; 
#1a=1; b=0; c=1;
#1a=1; b=1; c=0;
#1a=1; b=1; c=1;

end 
endmodule // testandgate 